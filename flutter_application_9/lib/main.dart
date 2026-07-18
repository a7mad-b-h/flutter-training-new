import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double size = 100;
  _play() {
    setState(() {
      size = 150;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Opacity(opacity: 0.3,child: Center(child: Image.network('https://www.dbooks.org/img/books/1098127463s.jpg'))),
      ),
    );
  }
}
