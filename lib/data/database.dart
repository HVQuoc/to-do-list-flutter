import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {

  List toDoList = [];
  
  final _to_do_box = Hive.box('todo_box');

  // first time opening the app
  void createInitialData() {
    toDoList = [
      ['Check the box on compleleted', false],
      ['Press + to add a new task', false],
      ['Right slide on a task to remove it', false],
    ];
  }

  // load data from database
  void loadData() {
    toDoList = _to_do_box.get("TODOLIST") ?? [];
  }

  // update the database
  void updateDatabase() {
    _to_do_box.put('TODOLIST', toDoList);
  }

}