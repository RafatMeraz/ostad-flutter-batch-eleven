import 'package:flutter/material.dart';
import 'package:live_class_project/counter_controller.dart';
import 'package:live_class_project/counter_controller_inherited_widget.dart';
import 'home_screen.dart';

void main() {
  runApp(CrudApp());
}

class CrudApp extends StatefulWidget {
  const CrudApp({super.key});

  @override
  State<CrudApp> createState() => _CrudAppState();
}

class _CrudAppState extends State<CrudApp> {
  CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return CounterControllerInheritedWidget(
      counterController: counterController,
      child: MaterialApp(
        title: 'Counter App',
        theme: ThemeData(colorSchemeSeed: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
