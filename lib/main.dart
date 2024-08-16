import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  List toDoList = [
    ['Flutter Lernen', false],
    ['Dart Lernen', false]
  ];

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
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: ,
                padding: EdgeInsets.all(20),
                color: Colors.deepPurple,
                child: Text(toDoList[index][0],style: TextStyle(fontSize: 18,color: Colors.white),),
              ),
            );
          }),
    );
  }
}
