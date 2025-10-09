import 'package:flutter/material.dart';
import 'package:live_class_project/counter_controller.dart';
import 'package:live_class_project/profile_screen.dart';
import 'package:live_class_project/settings_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
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
                  onPressed: context.read<CounterController>().increment,
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
