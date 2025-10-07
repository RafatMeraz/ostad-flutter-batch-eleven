import 'package:flutter/material.dart';
import 'package:live_class_project/counter_notifier.dart';

class CounterInheritedWidget extends InheritedWidget {
  final CounterNotifier counterNotifier;

  const CounterInheritedWidget({
    super.key,
    required this.counterNotifier,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static CounterInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }
}
