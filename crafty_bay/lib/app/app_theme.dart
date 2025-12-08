import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark
    );
  }
}