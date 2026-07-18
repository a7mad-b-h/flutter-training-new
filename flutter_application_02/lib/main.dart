import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
        title: Text("my Appp"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 30,
                offset: Offset(2, 2),
              ),
            ],
            image: DecorationImage(
              image: AssetImage("assets/T1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(100),
            child: Text(
              "Click Me",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
        // child: Text.rich(
        //   TextSpan(
        //     text: "DoT",
        //     style: TextStyle(
        //       color: Colors.redAccent
        //       ,fontSize: 30),
        //   children:[
        //     TextSpan(
        //       text: "Jordan",
        //     style: TextStyle(
        //       color: const Color.fromARGB(255, 82, 255, 94)
        //       ,fontSize: 30
        //       )
        //     ),
        //   ]
        //   )
        // ),
      ),
      
    );
  }
}
