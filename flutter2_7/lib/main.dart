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
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final  _controller = TextEditingController();

  String? _city;
  String? _description;
  double? _temperature;
  String? _condition;
  final String _apiKey = '19b15efc74b01eb7cc0574d85791c65c';

  Future<void> _fetchWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

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
        ).showSnackBar(SnackBar(content: Text('City not found')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error server not working')));
    }
  }

  String _getImage(String cond) {
    switch (cond) {
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
        appBar: AppBar(
          title: Text("Weather App"),
          centerTitle: true,
          backgroundColor: Colors.green[300],
          toolbarHeight: 100,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            TextField(
                controller: _controller ,
                decoration: InputDecoration(
                  hintText: "Enter city name",
                  suffixIcon: IconButton(
                    icon:  Icon(Icons.search),
                    onPressed: () => _fetchWeather(_controller.text.trim()),
                    )
                  
                ),
                
            ),
            if(_city!=null)
              Column(children: [
                Text(_city!),
                Image.asset(_getImage(_condition!))
              ],)
          ],),
        ),
      ),
    );
  }
}