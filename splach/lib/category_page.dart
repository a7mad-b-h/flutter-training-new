import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:splach/monument.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  CategoryPage({required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Monument> getMonument() {
    switch (widget.category) {
      case "churches":
        return [
          Monument(
            name: 'Church of St. George',
            description:
                """It is one of the oldest historical churches in the world, and it was a cave in which a Christian group worshiped in secret for fear of the oppression of the pagan Roman state.""",
            imagePath: 'assets/images/churches.jpg',
            latitude: 32.32166,
            longitude: 36.09681,
            imagePath1: 'assets/images/c1-1.jpg',
            imagePath2: 'assets/images/c1-2.jpg',
            imagePath3: 'assets/images/c1-3.jpg',
          ),
          Monument(
            name: 'Church of St. Mary',
            description:
                """It is one of the oldest historical churches in the world, and it was a cave in which a Christian group worshiped in secret for fear of the oppression of the pagan Roman state.""",
            imagePath: 'assets/images/cemeteries.jpg',
            latitude: 32.32166,
            longitude: 36.09681,
            imagePath1: 'assets/images/c1-1.jpg',
            imagePath2: 'assets/images/c1-2.jpg',
            imagePath3: 'assets/images/c1-3.jpg',
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Monument> monuments = getMonument();

    return Scaffold(
      appBar: AppBar(title: Text(widget.category)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: monuments.length,
          itemBuilder: (context,index){
            Monument current = monuments[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(borderRadius: BorderRadiusGeometry.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(current.imagePath)
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(current.name,style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(current.description),
                  ),
                  SizedBox(height: 1,),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.map),
                    )
                ],
              )
            );
          }
          ),
      ),
      );
  }
}
