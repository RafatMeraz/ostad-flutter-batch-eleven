import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Icon(Icons.star, color: Colors.amber, size: 20),
        Text('4.3'),
      ],
    );
  }
}
