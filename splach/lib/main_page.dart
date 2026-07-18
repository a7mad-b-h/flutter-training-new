import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splach/category_page.dart';
import 'package:provider/provider.dart';
import 'providors/theme_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final tp = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tourism in Rihab"),
        actions: [
          Row(
            children: [
              tp.isDarkMode? Icon(Icons.dark_mode):Icon(Icons.light_mode),
              Switch(
                activeThumbColor: Colors.grey,
                value: tp.isDarkMode,
                onChanged: (value) {
                  tp.toggleTheme();
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: SystemNavigator.pop,
        child: Icon(Icons.exit_to_app),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Rihab Village, located in Jordan Mafraq Governorate, is rich in archaeological history dating back to the Stone Age. It boasts ancient churches, tombs, water wells, and caves, reflecting its early Christian heritage. The village also features Islamic-era landmarks, including a historic mosque and towers.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(             
                crossAxisCount: 2,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CategoryPage(category: 'churches'),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.church, size: 50),
                          SizedBox(height: 10),
                          Text(
                            "churches",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => (),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.abc, size: 50),
                          SizedBox(height: 10),
                          Text(
                            "cemeteries",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => (),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.water, size: 50),
                          SizedBox(height: 10),
                          Text(
                            "water_wells",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => (),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.abc_sharp, size: 50),
                          SizedBox(height: 10),
                          Text(
                            "caves",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
