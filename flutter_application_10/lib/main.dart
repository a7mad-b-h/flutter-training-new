import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
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
       theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.pink,
            
            ),
           // textTheme: GoogleFonts.emilysCandyTextTheme(),
       ),
       );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result = "";
  void showFacts() async {
    final url = Uri.parse('https://catfact.ninja/fact');
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    setState(() {
      result = json['fact'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       backgroundColor:Colors.white ,
       appBar: AppBar(
        toolbarHeight: 100,
         backgroundColor: Colors.pink,
         title: Text("CAT FACTS", style: TextStyle(fontSize: 30,color: Colors.white)),
         centerTitle: true,
       ),
       body: Column(
         children: [
           Expanded(
             flex: 60,
             child: Center(child: Text(result,style: TextStyle(fontSize: 25),))),
           Expanded(
             flex: 40,
             child: Image.asset('assets/t1.png'),)
         ],
       ),
       floatingActionButton: FloatingActionButton(onPressed: showFacts , child: Text('Show'),),
           ),
    );
  }
}
