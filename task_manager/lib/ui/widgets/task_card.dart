import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      title: Text('Title will be here'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text('Description of task'),
          Text(
            'Date: 12/1/2021',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Row(
            children: [
              Chip(
                label: Text('New'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.grey),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
