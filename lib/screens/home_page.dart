import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/components/todo_list.dart';
import 'package:todo_app/components/dialog.dart';
import 'package:todo_app/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tasks = Hive.box('tasks');

  TasksDatabase db = TasksDatabase();
  final _taskNameController = TextEditingController();

  @override
  void initState() {
    if (_tasks.get("TASKSLIST") == null) {
      db.createInitalTask();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.update();
  }

  void saveTask() {
    setState(() {
      db.toDoList.add([_taskNameController.text, false]);
    });
    db.update();
    _taskNameController.text = "";
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.update();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogForm(
            taskNameController: _taskNameController,
            onSave: saveTask,
            onCancel: () =>
                {_taskNameController.text = "", Navigator.of(context).pop()},
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.white),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset("assets/icon/if.png", fit: BoxFit.cover)),
          ),
          centerTitle: true,
          title: const Text('IF ToDo'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return TodoList(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  removeTask: (context) => deleteTask(index),
                  onChanged: (value) => checkBoxChanged(value, index));
            }));
  }
}
