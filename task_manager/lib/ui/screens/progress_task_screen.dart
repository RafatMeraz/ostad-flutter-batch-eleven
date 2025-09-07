import 'package:flutter/material.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count_by_status_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Expanded(
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
      ),
    );
  }
}