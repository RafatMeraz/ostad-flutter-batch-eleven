import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

void main() {
  runApp(const TextScannerApp());
}

class TextScannerApp extends StatelessWidget {
  const TextScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  final TextRecognizer textRecognizer = TextRecognizer();
  XFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan Text')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_pickedImage != null) Image.file(File(_pickedImage!.path), height: 300),
            ElevatedButton(onPressed: _pickImage, child: Text('Pick image')),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    XFile? imageFromSource = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFromSource != null) {
      // TODO: Read the text from image
      _pickedImage = imageFromSource;
      _readTextFromImage(imageFromSource);
      setState(() {});
    }
  }

  Future<void> _readTextFromImage(XFile imageFile) async {
    final InputImage inputImage = InputImage.fromFilePath(imageFile.path);
    final RecognizedText recognizedText = await textRecognizer.processImage(
      inputImage,
    );

    String text = recognizedText.text;
    // print(text);
    for (TextBlock block in recognizedText.blocks) {
      // final Rect rect = block.boundingBox;
      // final List<Point<int>> cornerPoints = block.cornerPoints;
      // final String text = block.text;
      // final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        print(line.text);
        // for (TextElement element in line.elements) {
        //   // Same getters as TextBlock
        //   print(element);
        // }
      }
    }
  }
}
