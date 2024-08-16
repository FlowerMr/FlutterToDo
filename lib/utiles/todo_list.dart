import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class ToDoList extends StatelessWidget {
  const ToDoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      this.onChanged});
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(20),
        color: Colors.deepPurple,
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged),
            Text(
              taskName,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
