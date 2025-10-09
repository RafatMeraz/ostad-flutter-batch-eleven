import 'package:flutter/material.dart';

import 'counter_controller.dart';
import 'counter_controller_inherited_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        CounterControllerInheritedWidget.of(context)!.counterController;

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
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
    );
  }
}
