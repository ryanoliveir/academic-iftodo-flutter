import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TodoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;

  Function(bool?)? onChanged;
  Function(BuildContext?)? removeTask;

    TodoList({
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.removeTask,
      super.key,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: removeTask, 
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12)
            ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged, 
                activeColor: Colors.black, 
              ),
              // Task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none
                ),
              )
              
            ],
          )
        ),
      ),
    );
  }
}