import 'package:flutter/material.dart';
import 'package:live_class_project/gps_home_screen.dart';
import 'package:live_class_project/home_screen.dart';

void main() {
  runApp(MapApp());
}

class MapApp extends StatelessWidget {
  const MapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GpsHomeScreen(),
    );
  }
}
