import 'package:hive_flutter/hive_flutter.dart';

class TasksDatabase {


  List toDoList = [];


  final _tasks = Hive.box('tasks');



  // First time opening the app

  void createInitalTask() {
    toDoList = [
      ["Create a new task !", false]
    ];
  }

  void loadData() {
    toDoList = _tasks.get("TASKSLIST");
  }


  void update(){
   _tasks.put("TASKSLIST", toDoList); 
  }


  // void delete(){

  // }

}