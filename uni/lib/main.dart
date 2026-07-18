import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List universities = [];
  List filteredUniversities = [];
  String selectedCountry = 'Jordan';
  List<String> countries = ['Jordan', 'Egypt', 'Lebanon', 'Saudi Arabia'];

  void fetchUniversities() async {
    final response = await http.get(
      Uri.parse(
        'http://universities.hipolabs.com/search?country=$selectedCountry',
      ),
    );
    setState(() {
      universities = json.decode(response.body);
      filteredUniversities = universities;
    });
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }

  @override
  void initState() {
    super.initState();
    fetchUniversities();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          title: Text("Universities App"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DropdownButtonFormField(
                initialValue: selectedCountry,
                items: countries.map((country) {
                  return DropdownMenuItem(value: country, child: Text(country));
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    selectedCountry = value!;
                    fetchUniversities();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Country',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    filteredUniversities = universities.where((univ) {
                      final name = univ['name'].toLowerCase();
                      final input = value.toLowerCase();
                      return name.contains(input);
                    }).toList();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search by university name',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // list view must be on expanded
              Expanded(
                child: ListView.builder(
                  itemCount: filteredUniversities.length,
                  itemBuilder: (context, index) {
                    var univ = filteredUniversities[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              univ['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(univ['country']),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () => _launchUrl(univ['web_pages'][0]),
                              child: Text(
                                univ['web_pages'][0],
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
    );
    );
  }
}


https://www.instagram.com/faahhh_/
https://www.instagram.com/faahhh__/
https://www.instagram.com/faahhh___/
https://www.instagram.com/faahhh____/
https://www.instagram.com/faahhh_____/
https://www.instagram.com/faahhh______/
https://www.instagram.com/faahhh_______/
https://www.instagram.com/faahhh________/
https://www.instagram.com/faahhh_________/
https://www.instagram.com/faahhh__________/
https://www.instagram.com/faahhh___________/
https://www.instagram.com/faahhh____________/
https://www.instagram.com/faahhh_____________/
https://www.instagram.com/faahhh______________/
https://www.instagram.com/faahhh_______________/
https://www.instagram.com/faahhh________________/
https://www.instagram.com/faahhh_________________/