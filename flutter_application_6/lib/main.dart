import 'package:flutter/material.dart';
import 'my_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      title: "MyApp",
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool show = false;
//   void change() {
//     setState(() {
//       show = !show;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: show
//             ? Image.asset("assets/mountain-6815304_640.jpg")
//             : Text("no image"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: change,
//         child: show ? Text("Text") : Text("Image"),
//       ),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             spacing: 20,
//             children: [
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//             Text("hello"),
//           ],),
//         ),
//       ),

//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   var quotes = [
//     {
//       'author': 'Oscar Wilde',
//       'text': 'Be yourself; everyone else is already taken',
//     },
//     {
//       'author': 'Oscar Wilde',
//       'text': 'I have nothing to declare except my genius',
//     },
//     {
//       'author': 'Oscar Wilde',
//       'text': 'The truth is rarely pure and never simple',
//     },
//     {
//       'author': 'Oscar Wilde',
//       'text': 'I have nothing to declare except my genius',
//     },
//     {
//       'author': 'Oscar Wilde',
//       'text': 'I have nothing to declare except my genius',
//     },
//     {
//       'author': 'Oscar Wilde',
//       'text': 'I have nothing to declare except my genius',
//     },
//     {
//       'author': 'Oscar Wilde',
//       'text': 'I have nothing to declare except my genius',
//     },
//     {
//       'author': 'Oscar Wilde',
//       'text': 'I have nothing to declare except my genius',
//     },
//     {
//       'author': 'Oscar Wilde',
//       'text': 'I have nothing to declare except my genius',
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Using Lists"),
//         centerTitle: true,
//         backgroundColor: Colors.amber,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           /*spred*/ ...quotes.map(
//             (q) => Card(
//               margin: EdgeInsets.all(10),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(children: [
//                 Text("${q["text"]}",
//                 style: TextStyle(fontSize: 18),

//                 ),
//                 Text("${q["author"]}",
//                 style: TextStyle(fontSize: 18 ),

//                 )
//                 ]
//                 ),
//               )

//               ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: SafeArea(
//         child: ListView(children: [
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),
//           ListTile(leading: Icon(Icons.star),title: Text("Item 1"),),

//         ],
//         ),
//       ),
//     );
//   }
// }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = List<String>.generate(20, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("List View"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background:Container (color:Colors.red) ,
            key: Key(items[index]),
            onDismissed: (directin) {
              final removedItem = items[index];
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(duration: Duration(seconds: 1),content: Text("$removedItem dismissed")));
            },
            child: ListTile(title: Text(items[index])),
          );
        },
      ),
    );
  }
}
