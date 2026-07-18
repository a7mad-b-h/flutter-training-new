import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Me")),
      body: CustomScrollView(
  slivers: [
    // الجزء اللي فوق (أفقي) بس كـ Box داخل Sliver
    SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 50,
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              margin: const EdgeInsets.all(8),
              color: Colors.amber,
              child: Center(child: Text("hi $index")),
            );
          },
        ),
      ),
    ),

    // القائمة العمودية (SliverList)
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("mmmmmmmmmmmmmmmmmmmmmmm"),
            ),
          );
        },
        childCount: 50,
      ),
    ),
  ],
),
    );
  }
}
