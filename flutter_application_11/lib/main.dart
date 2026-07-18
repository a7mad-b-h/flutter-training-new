import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result = "Unknown";
  final cont = TextEditingController();

  getData(String name) async {
    if (name.trim().isEmpty) return;
    var response = await http.get(
      Uri.parse('https://api.genderize.io/?name=$name'),
    );
    var data = jsonDecode(response.body);
    setState(() {
      result = data['gender'] ?? 'Unknown';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gender App"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),

        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: cont,
                decoration: InputDecoration(hintText: 'Enter Name'),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  getData(cont.text);
                  cont.clear();
                },

                child: Text("Show Gender"),
              ),
              SizedBox(height: 40),
              Text(result, style: TextStyle(fontSize: 25)),
            ],
          ),
        ),
      ),
    );
  }
}