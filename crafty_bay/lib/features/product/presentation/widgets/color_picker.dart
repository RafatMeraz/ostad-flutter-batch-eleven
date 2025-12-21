import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChange});

  final List<String> colors;
  final Function(String) onChange;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (String color in widget.colors)
          GestureDetector(
            onTap: () {
              _selectedColor = color;
              widget.onChange(_selectedColor!);
              setState(() {});
            },
            child: Container(
              margin: .only(right: 8),
              padding: .symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
                color: _selectedColor == color ? AppColors.themeColor : null,
              ),
              child: Text(
                color,
                style: TextStyle(
                  color: _selectedColor == color ? Colors.white : null,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
