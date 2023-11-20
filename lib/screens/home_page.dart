import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List todoList = [
    ["Task 1", false],
    ["Task 2", false],
    ["Task 3", false],
    ["Task 4", false],
    ["Task 5", false],
  ];


  void checkBoxChanged(bool? value, int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TO DO'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoList(
            taskName: todoList[index][0], 
            taskCompleted: todoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index));
        }
      )
    );
  }
}

