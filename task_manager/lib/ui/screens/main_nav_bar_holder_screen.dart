import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/screens/progress_task_screen.dart';

import '../widgets/tm_app_bar.dart';

class MainNavBarHolderScreen extends StatefulWidget {
  const MainNavBarHolderScreen({super.key});

  @override
  State<MainNavBarHolderScreen> createState() => _MainNavBarHolderScreenState();
}

class _MainNavBarHolderScreenState extends State<MainNavBarHolderScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    ProgressTaskScreen(),
    ProgressTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.new_label_outlined),
            label: 'New',
          ),
          NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.close), label: 'Cancelled'),
          NavigationDestination(icon: Icon(Icons.done), label: 'Completed'),
        ],
      ),
    );
  }
}