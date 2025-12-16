import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppColors.themeColor.withAlpha(30),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(Icons.computer, size: 28, color: AppColors.themeColor),
          ),
        ),
        Text(
          'Computer',
          style: TextStyle(
            fontWeight: .w500,
            color: AppColors.themeColor,
            letterSpacing: .6,
          ),
        ),
      ],
    );
  }
}
