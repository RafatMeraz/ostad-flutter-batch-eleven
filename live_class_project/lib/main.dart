import 'package:flutter/material.dart';
import 'package:live_class_project/counter_controller.dart';
import 'package:live_class_project/theme_controller.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

void main() {
  runApp(CrudApp());
}

class CrudApp extends StatefulWidget {
  const CrudApp({super.key});

  @override
  State<CrudApp> createState() => _CrudAppState();
}

class _CrudAppState extends State<CrudApp> {
  CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => counterController),
      ],
      child: Consumer<ThemeController>(
        builder: (context, themeController, _) {
          return MaterialApp(
            title: 'Counter App',
            theme: ThemeData(
              brightness: Brightness.light,
              colorSchemeSeed: Colors.blue,
            ),
            home: HomeScreen(),
            themeMode: themeController.themeMode,
            darkTheme: ThemeData(brightness: Brightness.dark),
          );
        },
      ),
    );
  }
}
