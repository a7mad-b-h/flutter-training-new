import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const TourismApp());
}

class TourismApp extends StatelessWidget {
  const TourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const SplashPage(),
    );
  }
}

/// ---------------- SPLASH ----------------
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("RIHAB",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Tourism in Rihab",
                style: TextStyle(color: Colors.white70)),
            SizedBox(height: 20),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

/// ---------------- HOME ----------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = DemoData.categories;

    return Scaffold(
      appBar: AppBar(title: const Text("Tourism in Rihab")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, i) {
          final c = categories[i];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlacesPage(category: c),
                ),
              );
            },
            child: Card(
              child: Center(
                child: Text(c.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ---------------- PLACES ----------------
class PlacesPage extends StatelessWidget {
  final Category category;
  const PlacesPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final places = DemoData.getPlaces(category.id);

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: places.length,
        itemBuilder: (context, i) {
          final p = places[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsPage(place: p),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    p.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      p.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ---------------- DETAILS ----------------
class DetailsPage extends StatelessWidget {
  final Place place;
  const DetailsPage({super.key, required this.place});

  Future<void> openMap() async {
    final url = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=${place.lat},${place.lng}");
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.name)),
      body: ListView(
        children: [
          Image.network(
            place.imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(place.description,
                style: const TextStyle(fontSize: 15, height: 1.4)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton.icon(
              onPressed: openMap,
              icon: const Icon(Icons.location_on),
              label: const Text("Open Location"),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

/// ---------------- DATA ----------------
class Category {
  final String id;
  final String title;
  const Category({required this.id, required this.title});
}

class Place {
  final String id;
  final String categoryId;
  final String name;
  final String description;
  final String imageUrl;
  final double lat;
  final double lng;

  const Place({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.lat,
    required this.lng,
  });
}

class DemoData {
  static const categories = [
    Category(id: "churches", title: "Churches"),
    Category(id: "caves", title: "Caves"),
  ];

  static List<Place> getPlaces(String categoryId) {
    return places.where((p) => p.categoryId == categoryId).toList();
  }

  static const places = [
    Place(
      id: "1",
      categoryId: "churches",
      name: "Church of St. George",
      description:
          "One of the oldest churches in Rihab, Jordan. A historical Christian worship site.",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/3/3a/Rihab_Jordan_church.jpg",
      lat: 32.32166,
      lng: 36.09681,
    ),
    Place(
      id: "2",
      categoryId: "caves",
      name: "Rihab Caves",
      description:
          "Ancient caves in Rihab believed to be used by early Christians.",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/5/5d/Rihab_caves_Jordan.jpg",
      lat: 32.32280,
      lng: 36.09810,
    ),
  ];
}
