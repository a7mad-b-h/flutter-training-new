import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});
  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  List todolist = [];
  String singleValue = "";
  bool isDelete = true;
  final cont = TextEditingController();
  addList() {
    setState(() {
      todolist.add({"value": singleValue});
    });
  }

  _showDialog(context, index) async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure you want to delete ${todolist[index]['value']}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
                isDelete = false;
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Ok');
                isDelete = true;
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  deleteItem(index) async {
    await _showDialog(context, index);
    setState(() {
      if(isDelete)
       todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 90,
            child: ListView.builder(
              itemCount: todolist.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(todolist[index]['value']),
                        IconButton(
                          onPressed: () {
                            deleteItem(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  flex: 70,
                  child: TextField(
                    maxLength: 30,
                    controller: cont,
                    onChanged: (value) {
                      singleValue = value;
                    },
                    decoration: InputDecoration(hintText: "Task"),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    addList();
                    cont.clear();
                  },
                  child: Text("Add"),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
