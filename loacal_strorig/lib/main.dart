import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _savedUserName = 'No username saved';
  final _controller = TextEditingController();

  static const String _keyUsername = 'username';

  Future<void> _saveUserName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, _controller.text.trim());
    await _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedUserName = prefs.getString(_keyUsername) ?? 'No username saved';
    });
  }

  Future<void> _clearUserName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUsername);
    _controller.clear();
    await _loadUserName();
  }

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Storage")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saved Username: $_savedUserName'),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Username',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveUserName,
              child: const Text("Save name"),
            ),
            ElevatedButton(
              onPressed: _clearUserName,
              child: const Text("Clear name"),
            ),
          ],
        ),
      ),
    );
  }
}
