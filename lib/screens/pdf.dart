import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatelessWidget {
  final String path;
  const PDFScreen({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    final file = File(path);

    if (!file.existsSync()) {
      return Scaffold(
        appBar: AppBar(title: const Text('PDF Viewer')),
        body: const Center(
          child: Text('PDF file not found. Please try again.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('PDF Viewer', style: TextStyle(color: Colors.white)),
      ),
      body: SfPdfViewer.file(file),
    );
  }
}
