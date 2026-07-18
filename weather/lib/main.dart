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
  final _controller = TextEditingController();
  String? _city;
  String? _description;
  double? _temperature;
  String? _condition;
  final _apiKey = '8913ce58b7f1c7428bff2547223ecda2';
  _fetchWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric';
    try {
      final respons = await http.get(Uri.parse(url));
      if (respons.statusCode == 200) {
        final data = jsonDecode(respons.body);
        setState(() {
          _city = data['name'];
          _description = data['weather'][0]['description'];
          _temperature = data['main']['temp'].toDouble();
          _condition = data['weather'][0]['main'].toLowerCase();
        });
      } else {
        setState(() {
          _city = null;
          _description = null;
          _temperature = null;
          _condition = null;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('city not found')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error serever not working')));
    }
  }

  String _getImage(String condition) {
    switch (condition) {
      case 'clear':
        return 'assets/sun.gif';
      case 'rain':
        return 'assets/rain.gif';
      case 'clouds':
        return 'assets/clouds.gif';
      default:
        return 'assets/not_found.gif';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Weather App")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                
              )
              ]
              ),
        ),
      ),
    );
  }
}
