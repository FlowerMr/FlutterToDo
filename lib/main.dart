import 'package:flutter/material.dart';
import 'package:todo/home_Page.dart';
import 'package:todo/utiles/todo_list.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
