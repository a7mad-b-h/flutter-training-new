import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(scrolledUnderElevation: 0,
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Text(
                  "messenger",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.note_alt_outlined),
                SizedBox(width: 10),
                Icon(Icons.facebook),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: TextField(
                  cursorColor: Colors.grey,

                  decoration: InputDecoration(
                    hint: Text('Search'),

                    fillColor: Colors.blue,
                    focusColor: Colors.blue,
                    prefixIconColor: Colors.blue,
                    hoverColor: Colors.amber,
                    //labelText:'Ask Meta AI or Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
            ),

            //SizedBox(height: 20),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          ),
                        ),
                      ),
                      Text("jo"),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14, left: 14,top: 4,
                      bottom: 4),
                    child: Text("All"),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 14, left: 14,top: 4,
                      bottom: 4),
                    child: Text("Unread"),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 14,
                      left: 14,
                      top: 4,
                      bottom: 4
                    ),
                    child: Text("Groups"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 40,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      onTap: () => (),
                      
                      leading: InkWell(splashColor:  Colors.black ,
                        onTap: () => print("hello"),
                        child: CircleAvatar(
                          
                          radius: 40,
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          ),
                        ),
                      ),
                      title: Text("jo"),
                      subtitle: Text("hi 1:45am"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.blue[900],
          onPressed: () => (),
          child: Icon(Icons.circle_outlined),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories),
              label: "Stories",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          ],
        ),
      ),
    );
  }
}
