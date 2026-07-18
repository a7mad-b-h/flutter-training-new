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
    return MaterialApp(home: Home(), debugShowCheckedModeBanner: false);
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List universities = [];
  List filteredUniversities = [];
  String selectedCountry = 'Jordan';
  List<String> countries = ['Jordan', 'Egypt', 'Lebanon', 'Saudi Arabia'];
  Future<void> fetchUniversities() async {
    final response = await http.get(
      Uri.parse('http://universities.hipolabs.com/search?country=jordan'),
    );
    setState(() {
      universities = json.decode(response.body);
      filteredUniversities = universities;
    });
  }

  @override
  // void initState() {
  //   super.initState();
  //   fetchUniversities();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("University app"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField(
              initialValue: selectedCountry,
              items: countries.map((country) {
                return DropdownMenuItem(value: country, child: Text(country));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value!;
                  fetchUniversities();
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Country',
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 13.2,),
            TextField(
              decoration: InputDecoration(
                labelText: "search by university name",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0))
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
