import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home(), debugShowCheckedModeBanner: false);
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  List<int> starCounts = [1, 1, 1];

  void printStars(int index){
    setState(() {
      starCounts[index] = starCounts[index]%5 +1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.red[400],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: ()=>printStars(index),
            title: Text(items[index]),
            leading: Icon(Icons.restaurant),
            subtitle: Row(
              children: [for (var i = 0; i < starCounts[index]; i++) 
                Icon(Icons.star,color: Colors.yellow,),
              ],
            ),
          );
        },
      ),
    );
  }
}



// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//       body: GridView.count(
//         crossAxisCount: 3,
//         children: [
//           Container(color:Colors.red),
//           Container(color:Colors.blue),
//           Container(color:Colors.yellowAccent),
//           Container(color:Colors.green),
//         ],
//       ),
//     );
//   }
// }