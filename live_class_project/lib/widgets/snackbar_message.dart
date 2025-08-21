import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
