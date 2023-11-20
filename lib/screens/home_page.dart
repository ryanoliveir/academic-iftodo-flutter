import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_list.dart';
import 'package:todo_app/components/dialog.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _taskNameController = TextEditingController();


  List todoList = [
    ["Task 1", false],
    ["Task 2", false],
  ];


  void checkBoxChanged(bool? value, int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
      
    });
    
  }

  void saveTask(){
    setState(() {
        todoList.add([_taskNameController.text, false]);
    });
    _taskNameController.text = "";
    Navigator.of(context).pop();
  }

  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }

  void createNewTask(){
    showDialog(context: context, 
      builder: (context){
      return DialogForm(
        taskNameController: _taskNameController,
        onSave: saveTask,
        onCancel: () => { 
          _taskNameController.text = "",
          Navigator.of(context).pop()
        },
      );
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoList(
            taskName: todoList[index][0], 
            taskCompleted: todoList[index][1], 
            removeTask: (context) => deleteTask(index),
            onChanged: (value) => checkBoxChanged(value, index));
        }
      )
    );
  }
}

