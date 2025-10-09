import 'package:flutter/material.dart';
import 'package:live_class_project/theme_controller.dart';
import 'package:provider/provider.dart';

import 'counter_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterController>(
              builder: (context, controller, child) {
                return Text('${controller.counter}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: context.read<CounterController>().increment,
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: context.read<CounterController>().decrement,
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
            IconButton(onPressed: () {
              context.read<ThemeController>().toggleThemeMode();
            }, icon: Icon(Icons.sunny)),
          ],
        ),
      ),
    );
  }
}
