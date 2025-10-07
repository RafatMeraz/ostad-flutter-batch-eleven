import 'package:flutter/material.dart';
import 'package:live_class_project/counter_widget.dart';
import 'package:live_class_project/screens/reset_password_screen.dart';
import 'package:live_class_project/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final counter = CounterWidget.of(context)?.counter ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => SettingsScreen(),
                  ),
                );
              },
              child: Text('Settings'),
            ),
            FilledButton(onPressed: () {}, child: Text('Abc')),
            FilledButton(onPressed: () {}, child: Text('Profile')),
            FilledButton(onPressed: () {}, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
