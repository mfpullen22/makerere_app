import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatelessWidget {
  final String path;
  const PDFScreen({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    print("Opening PDF from path: $path");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('PDF Viewer', style: TextStyle(color: Colors.white)),
      ),
      body: SfPdfViewer.file(File(path)), // Using Syncfusion PDF viewer
    );
  }
}
