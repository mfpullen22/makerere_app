import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFScreen extends StatelessWidget {
  final String path;
  const PDFScreen({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('PDF Viewer', style: TextStyle(color: Colors.white)),
      ),
      body: PDFView(
        filePath: path,
        autoSpacing: false,
        enableSwipe: true,
        pageSnap: true,
        //swipeHorizontal: true,
        nightMode: false,
      ),
    );
  }
}
