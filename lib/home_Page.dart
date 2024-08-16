import 'package:flutter/material.dart';
import 'package:todo/utiles/todo_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [];

  @override
  void initState() {
    super.initState();
    loadData(); // Load saved data when the app starts
  }

  // Load data from SharedPreferences
  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedData = prefs.getString('todo_list');
    if (savedData != null) {
      setState(() {
        toDoList = jsonDecode(savedData);
      });
    }
  }

  // Save data to SharedPreferences
  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('todo_list', jsonEncode(toDoList));
  }

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
    saveData();
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    saveData();
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
    saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text("ToDo "),
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
              deletefunction: (BuildContext context) => deleteTask(index),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: "Add a new Item",
                      filled: true,
                      fillColor: Colors.deepPurple.shade200,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
