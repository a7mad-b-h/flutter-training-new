import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  int conut = 0;
  void increment() {
    conut++;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => Counter(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(), debugShowCheckedModeBanner: false);
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    final cp = Provider.of<Counter>(context);
    return Scaffold(
      body: Center(child: Text('Count= ${cp.conut}')),
      floatingActionButton: FloatingActionButton(onPressed: cp.increment),
      );
  }
}
