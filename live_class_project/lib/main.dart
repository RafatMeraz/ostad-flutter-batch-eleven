import 'package:flutter/material.dart';
import 'package:live_class_project/screens/home_screen.dart';

void main() {
  runApp(CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud App',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue
      ),
      home: HomeScreen(),
    );
  }
}
