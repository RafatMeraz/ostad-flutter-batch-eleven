import 'package:flutter/material.dart';
import 'package:live_class_project/counter_inherited_widget.dart';
import 'package:live_class_project/counter_notifier.dart';
import 'package:live_class_project/screens/reset_password_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final counterNotifier = CounterInheritedWidget.of(context)!.counterNotifier;

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Column(
          children: [
            ListenableBuilder(
              listenable: counterNotifier,
              builder: (context, child) {
                return Text(counterNotifier.counter.toString());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    counterNotifier.decrement();
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    counterNotifier.increment();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => ResetPasswordScreen()),
                );
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
