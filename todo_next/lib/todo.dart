import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _todoState();
}

class _todoState extends State<Todo> {
  List<String> todoList = [];
  String singlevalue = "";
  final controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  addString(content) {
    setState(() {
      singlevalue = content;
    });
  }

  addList() {
    setState(() {
      todoList.add({"value": singlevalue});
    });
  }

  deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            flex: 90,
            child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              todoList[index]['value'],
                            ),
                            IconButton(
                              onPressed: () {
                                deleteItem(index);
                              },
                              icon: Icon(Icons.delete),
                              color: Color.fromARGB(255, 201, 188, 188),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: TextField(
                      maxLength: 50,
                      controller: controller,
                      focusNode: _focusNode,
                      onChanged: (content) {
                        addString(content);
                      },
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Task',
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      addList();
                      controller.clear();
                      FocusScope.of(context).requestFocus(_focusNode);
                    },
                    child: Text("Add"),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
