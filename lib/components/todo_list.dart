import 'package:flutter/material.dart';


class TodoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;

  Function(bool?)? onChanged;

    TodoList({
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      super.key,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
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
    );
  }
}