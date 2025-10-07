import 'package:flutter/material.dart';

class CounterWidget extends InheritedWidget {
  final int counter;
  final VoidCallback increment;
  final VoidCallback decrement;

  const CounterWidget({
    super.key,
    required this.counter,
    required super.child,
    required this.decrement,
    required this.increment,
  });

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static CounterWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterWidget>();
  }
}
