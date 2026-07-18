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
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List result = [];
  getData() async {
    
    var respnse = await http.get(
      Uri.parse("https://www.dbooks.org/api/recent"),
    );
    setState(() {
    result = jsonDecode(respnse.body)['books'];
    });
  }

  @override
  initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 140, 0),
          title: Text('Books App', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: result.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Image.network(
                      result[index]['image'],
                      width: 400,
                      height: 300,
                    ),
                    Text("title: ${result[index]['title']}"),
                    Text("author: ${result[index]['authors']}"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
