import 'package:flutter/material.dart';
import 'package:splach/splash.dart';
import 'package:provider/provider.dart';
import 'providors/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThemeProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tp = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: "ahmad",
      theme: tp.isDarkMode ? ThemeData.dark():ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
