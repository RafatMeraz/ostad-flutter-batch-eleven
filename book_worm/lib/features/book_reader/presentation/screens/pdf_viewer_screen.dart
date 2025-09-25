import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatefulWidget {
  const PdfViewerScreen({super.key, required this.pdfFile, required this.pages});

  final File pdfFile;
  final List<String> pages;

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  final FlutterTts _flutterTts = FlutterTts();

  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  void _initTts() {
    _flutterTts.setCompletionHandler(_addCompleteHandler);
  }

  @override
  Widget build(BuildContext context) {
    _pdfViewerController.annotationMode = PdfAnnotationMode.highlight;

    return Scaffold(
      appBar: AppBar(title: Text('Book viewer'),),
      body: SfPdfViewer.file(
          widget.pdfFile,
        controller: _pdfViewerController,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: _play, icon: Icon(Icons.play_arrow)),
            IconButton(onPressed: _stop, icon: Icon(Icons.stop)),
            IconButton(onPressed: _playPreviousPage, icon: Icon(Icons.navigate_before)),
            IconButton(onPressed: _playNextPage, icon: Icon(Icons.navigate_next)),
          ],
        ),
      ),
    );
  }

  Future<void> _playNextPage() async {
    await _stop();
    _currentPage = _pdfViewerController.pageNumber + 1;
    _play();
  }

  Future<void> _playPreviousPage() async {
    await _stop();
    _currentPage = _pdfViewerController.pageNumber - 1;
    _play();
  }

  Future<void> _play() async {
    _pdfViewerController.jumpToPage(_currentPage);
    _flutterTts.speak(widget.pages[_currentPage-1]);
    _addCompleteHandler();
  }

  void _addCompleteHandler() {
    _flutterTts.completionHandler = () {
      _currentPage = _currentPage + 1;
      _pdfViewerController.jumpToPage(_currentPage);
      _flutterTts.speak(widget.pages[_currentPage-1]);
    };
  }

  // void _addProgressHandler() {
  //   _flutterTts.progressHandler = (String text, int start, int end, String word) {
  //     addHighlightAnnotation(word);
  //   };
  // }

  // void addHighlightAnnotation(String word) {
  //   // Get the selected text lines.
  //   PdfTextLine textLines = PdfTextLine(
  //       Rect.fromCircle(center: Offset.zero, radius: 10), word, _currentPage);
  //   // Create the highlight annotation.
  //   final HighlightAnnotation highlightAnnotation = HighlightAnnotation(
  //     textBoundsCollection: [textLines],
  //   );
  //   // Add the annotation to the PDF document.
  //   _pdfViewerController.addAnnotation(highlightAnnotation);
  // }

  Future<void> _stop() async {
    await _flutterTts.stop();
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }
}
