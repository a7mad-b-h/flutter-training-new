import 'package:flutter/material.dart';
import 'dart:async';
import 'main_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 70), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.jpg",width: 230,height: 230,),
            SizedBox(height: 20),
            Text(
              "TOURISM IN RIHAB",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Text(
              "السياحة في رحاب",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
