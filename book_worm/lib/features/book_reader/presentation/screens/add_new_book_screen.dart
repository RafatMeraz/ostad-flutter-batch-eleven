import 'dart:io';

import 'package:book_worm/features/book_reader/presentation/screens/pdf_viewer_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:read_pdf_text/read_pdf_text.dart';

class AddNewBookScreen extends StatefulWidget {
  const AddNewBookScreen({super.key});

  @override
  State<AddNewBookScreen> createState() => _AddNewBookScreenState();
}

class _AddNewBookScreenState extends State<AddNewBookScreen> {
  final FlutterTts _flutterTts = FlutterTts();

  List<String> texts = [];
  int _currentIndex = -1;
  int _startMark = -1;
  int _endMark = -1;

  void _listenCompletionHandler() {
    _flutterTts.completionHandler = () {
      _currentIndex = _currentIndex + 1;
      _flutterTts.speak(texts[_currentIndex]);
      setState(() {});
    };
  }

  void _listenWord() {
    _flutterTts.progressHandler = (String text, int start, int end, String word) {
      _startMark = start;
      _endMark = end;
      setState(() {

      });
    };
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Book')),
      body: Center(
        child: Column(
          children: [
            FilledButton(onPressed: _pickPdf, child: Text('Pick file')),
            if (_currentIndex != -1)
              Expanded(
                child: SingleChildScrollView(child: highlightTextByIndex(texts[_currentIndex], _startMark, _endMark)),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result?.isSinglePick ?? false) {
      print(result?.files);
      File file = File(result!.files.first.path!);

      texts = await getPDFText(result.files.first.path!);

      Navigator.push(context, MaterialPageRoute(
          builder: (context) => PdfViewerScreen(pdfFile: file, pages: texts)));
      //   _currentIndex = 1;
      //
      //   await _flutterTts.speak(texts[_currentIndex]);
      //   setState(() {});
      //   _listenCompletionHandler();
      //   _listenWord();
      // }
    }
  }

  Future<List<String>> getPDFText(String path) async {
    List<String> text = [];
    try {
      text = await ReadPdfText.getPDFtextPaginated(path);
    } on PlatformException {
      print('Failed to get PDF text.');
    }
    return text;
  }

  Widget highlightTextByIndex(String text, int startIndex, int endIndex) {
    // Ensure the indices are valid.
    if (startIndex < 0 || endIndex > text.length || startIndex > endIndex) {
      return Text(text);
    }

    // Define the highlight style with a soft yellow color.
    final TextStyle highlightStyle = TextStyle(
      backgroundColor: Colors.yellow.withOpacity(0.4), // Soft yellow color
    );

    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black
        ),
        children: <TextSpan>[
          // Part 1: Text before the highlight
          TextSpan(text: text.substring(0, startIndex)),

          // Part 2: The highlighted text
          TextSpan(
            text: text.substring(startIndex, endIndex),
            style: highlightStyle,
          ),

          // Part 3: Text after the highlight
          TextSpan(text: text.substring(endIndex)),
        ],
      ),
    );
  }
}
