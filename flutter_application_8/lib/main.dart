import 'package:flutter/material.dart';
import 'Todo.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool stat = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("To Do App",
          style: TextStyle(fontSize: 25),),
          centerTitle: true,
          actions: [
            Switch(
              value: stat,
               onChanged: (value){
                setState(() {
                  stat = value;
                });
               },
               ),
            stat ? Icon(Icons.dark_mode):Icon(Icons.light_mode),
            SizedBox(width: 20,)
          ],
        ),
        body: Todo(),
      ),
      debugShowCheckedModeBanner: false,
      theme: stat ? ThemeData.dark(): ThemeData.light(),
    );
  }
}