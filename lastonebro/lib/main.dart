import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

// Firestore collection reference
final employees = FirebaseFirestore.instance.collection("employees");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // User is logged in
          if (snapshot.hasData) {
            return const HomePage();
          }
          // User not logged in
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}

// AuthService handles Google login and logout
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login with Google
  Future<void> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        final provider = GoogleAuthProvider();
        await _auth.signInWithPopup(provider);
        return;
      }

      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return; // User canceled

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Error during Google Sign In: $e');
    }
  }

  // Logout
  Future<void> signOut() async {
    try {
      if (kIsWeb) {
        await _auth.signOut();
        return;
      }
      await GoogleSignIn().signOut();
      await _auth.signOut();
    } catch (e) {
      print('Error during sign out: $e');
    }
  }
}

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthService().signInWithGoogle();
          },
          child: const Text("Login with Google"),
        ),
      ),
    );
  }
}

// Home Page with Employees list
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${user?.displayName ?? ""}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService().signOut();
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: employees.where('userId', isEqualTo: user?.uid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          if (docs.isEmpty) {
            return const Center(child: Text("No Employees Yet"));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text("Name: ${doc['name']}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Age: ${doc['age']}"),
                      Text("Location: ${doc['location']}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: () => _showEditDialog(context, doc.id, doc),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => employees.doc(doc.id).delete(),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEmployeePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showEditDialog(BuildContext context, String id, DocumentSnapshot doc) {
    TextEditingController name = TextEditingController(text: doc['name']);
    TextEditingController age = TextEditingController(
      text: doc['age'].toString(),
    );
    TextEditingController location = TextEditingController(
      text: doc['location'],
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Details"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: age,
              decoration: const InputDecoration(labelText: "Age"),
            ),
            TextField(
              controller: location,
              decoration: const InputDecoration(labelText: "Location"),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await employees.doc(id).update({
                "name": name.text,
                "age": int.parse(age.text),
                "location": location.text,
              });
              Navigator.pop(context);
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }
}

// Add Employee Page
class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController age = TextEditingController();
    TextEditingController location = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Add Employee")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: age,
              decoration: const InputDecoration(labelText: "Age"),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: location,
              decoration: const InputDecoration(labelText: "Location"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                final uid = FirebaseAuth.instance.currentUser?.uid;
                if (uid == null) return;

                await employees.add({
                  "name": name.text,
                  "age": int.parse(age.text),
                  "location": location.text,
                  "userId": uid,
                });
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}