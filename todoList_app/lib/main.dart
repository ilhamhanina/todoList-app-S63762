/// Author: Ilham Hanina S63762
/// Program: main.dart for todoList_app
/// Date modified: 7 January 2024
///
import 'package:flutter/material.dart';
import 'package:todoList_app/widgets/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoList(),
    );
  }
}
