import 'package:flutter/material.dart';
import 'package:live_class_project/counter_controller.dart';
import 'package:live_class_project/counter_controller_inherited_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        CounterControllerInheritedWidget.of(context)!.counterController;

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
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
