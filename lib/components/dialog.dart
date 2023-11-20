import 'package:flutter/material.dart';
import 'package:todo_app/components/button.dart';


class DialogForm extends StatelessWidget {

  final TextEditingController taskNameController;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogForm({
    required this.onSave,
    required this.onCancel,
    required this.taskNameController,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return  
      AlertDialog(
        backgroundColor: Colors.yellow,
        content: SizedBox (
            height: 120,
            child:  Column(
              children: [
                // Name of task
                 TextField(
                  controller: taskNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Task name'
                  ),
                  
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonCustom(text: "Save" , onPressed: onSave),
                    const SizedBox(width: 4),
                    ButtonCustom(text: "Cancel" , onPressed: onCancel),
                    
                  ],
                )
                // Save button 
                // Calcel Button
              ],
            ),
          
        ),

        title: const Text('New task')
      );
  }
}
