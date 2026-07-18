import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home(), debugShowCheckedModeBanner: false);
  }


  
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text("hello"),
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SizedBox(
        width: 200,
        child: Text(
          "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.amber[900],
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
            letterSpacing: 2,
            wordSpacing: 20,
            /*اي اشي اخره جمع بوخذ ليست*/ shadows: [
              Shadow(blurRadius: 10.3, color: Colors.red, offset: Offset(2, 2)),
              Shadow(
                blurRadius: 5.3,
                color: const Color.fromARGB(255, 0, 255, 51),
                offset: Offset(-2, -2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
