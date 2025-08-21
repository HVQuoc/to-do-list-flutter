import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/components/dialog_box.dart';
import 'package:to_do_list_flutter/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  // List of to-do tasks
  List toDoList = [
    ['Task 1', false],
    ['Task 2', false],
    ['Task 3', false],
  ];

  // Function
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // create new task
  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(controller: _controller);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(title: Text("To-Do List")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new task logic can be implemented here
          createNewTask();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
