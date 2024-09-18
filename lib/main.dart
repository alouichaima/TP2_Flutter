import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _ToDoApp(),
    );
  }
}

class _ToDoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ToDoList();
}

class ToDoList extends State<_ToDoApp> {
  List<String> names = [];
  TextEditingController controller = TextEditingController();

  addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        names.add(controller.text);
        controller.clear();
      });
    }
  }

  _removeTask(int index) {
    setState(() {
      names.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To_Do_List"),
        backgroundColor: const Color.fromARGB(255, 50, 150, 50),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Enter Task",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(names[index]),
                      onLongPress: () {
                        _removeTask(index);
                      },
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 50, 150, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
