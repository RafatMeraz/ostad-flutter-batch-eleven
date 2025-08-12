// Create an app for manage your todos
// Todos - id, title, description, status(Pending, InProgress, Done), createdAt
// List will hold the todos
// new screen for create todos

import 'package:flutter/material.dart';
import 'package:todo_app/home_screen.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
