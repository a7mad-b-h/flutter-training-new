import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://eoibziitnhvlfkktedwc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVvaWJ6aWl0bmh2bGZra3RlZHdjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA4MDI1NjQsImV4cCI6MjA4NjM3ODU2NH0.ALJFzmT9L-WqJq7MiWJK4uv5xKIwr9YiyO54aL9MeP4',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final supabase = Supabase.instance.client;
  List<dynamic> notes = [];
  Future<void> fitchNote() async{
    
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text("NOTES APP"),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
