import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String color in widget.sizes)
          GestureDetector(
            onTap: () {
              _selectedSize = color;
              widget.onChange(_selectedSize!);
              setState(() {});
            },
            child: Container(
              margin: .only(right: 8),
              padding: .symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
                color: _selectedSize == color ? AppColors.themeColor : null,
              ),
              child: Text(
                color,
                style: TextStyle(
                  color: _selectedSize == color ? Colors.white : null,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
