import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerField extends StatelessWidget {
  const PhotoPickerField({super.key, required this.onTap, this.selectedPhoto});

  final VoidCallback onTap;
  final XFile? selectedPhoto;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          spacing: 8,
          children: [
            Container(
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              alignment: Alignment.center,
              child: Text('Photo', style: TextStyle(color: Colors.white)),
            ),
            Expanded(
              child: Text(
                selectedPhoto == null
                    ? 'No photo selected'
                    : selectedPhoto!.name,
                maxLines: 1,
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
