import 'package:flutter/material.dart';
import 'package:live_class_project/counter_controller.dart';
import 'package:live_class_project/profile_screen.dart';
import 'package:live_class_project/settings_screen.dart';

import 'counter_controller_inherited_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        CounterControllerInheritedWidget.of(context)!.counterController;

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListenableBuilder(
              listenable: counterController,
              builder: (context, child) {
                return Text('${counterController.counter}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: counterController.increment,
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: counterController.decrement,
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => SettingsScreen()),
              );
            },
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => ProfileScreen()),
              );
            },
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
