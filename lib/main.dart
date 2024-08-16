import 'package:flutter/material.dart';
import 'package:todo/utiles/todo_list.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  List toDoList = [
    ['Flutter Lernen', false],
    ['Dart Lernen', false],
    // ['code Lernen', false]
  ];
  checkBoxChanged(int index) {
    toDoList[index][1] = !toDoList[index][1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: Text("ToDo "),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return ToDoList(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
            );
          }),
    );
  }
}
