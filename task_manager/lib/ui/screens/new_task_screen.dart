import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count_by_status_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 90,
              child: ListView.separated(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TaskCountByStatusCard(title: 'New', count: 2);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 4);
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TaskCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 8);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTaskButton,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapAddNewTaskButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNewTaskScreen()),
    );
  }
}
