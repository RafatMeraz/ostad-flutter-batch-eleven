import 'package:book_worm/features/book_reader/presentation/screens/add_new_book_screen.dart';
import 'package:flutter/material.dart';

class BookWorm extends StatelessWidget {
  const BookWorm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.purple
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.purple
      ),
      home: AddNewBookScreen(),
    );
  }
}
