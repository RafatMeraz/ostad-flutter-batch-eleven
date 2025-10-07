import 'package:flutter/material.dart';

import '../counter_inherited_widget.dart';
import '../counter_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final counterNotifier = CounterInheritedWidget.of(context)!.counterNotifier;

    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: Center(
        child: Column(
          children: [
            ListenableBuilder(
              listenable: counterNotifier,
              builder: (context, child) {
                return Text(counterNotifier.counter.toString());
              }
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
          ],
        ),
      ),
    );
  }
}
