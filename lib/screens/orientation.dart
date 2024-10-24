import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makerere_app/models/lectures.dart';
import 'package:makerere_app/screens/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class OrientationScreen extends StatelessWidget {
  const OrientationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Lecture> lectures = [
      Lecture(title: "Anasplasma", fileName: "anaplasma.pdf"),
      Lecture(title: "Bioterror", fileName: "bioterror.pdf"),
      Lecture(title: "Frostbite", fileName: "frostbite.pdf"),
      Lecture(title: "Mycobacterium abscessus", fileName: "m_abscessus.pdf"),
      Lecture(title: "Neurosyphilis", fileName: "neurosyphilis.pdf"),
    ];

    Future<void> openPDF(BuildContext context, String fileName) async {
      try {
        print("Attempting to load PDF: $fileName from assets...");

        // Get the app's documents directory
        String path = (await getApplicationDocumentsDirectory()).path;
        String assetPath = 'assets/pdfs/$fileName';
        String filePath = '$path/$fileName';

        print("Asset path: $assetPath");
        print("File path in app directory: $filePath");

        // Check if the file already exists in the local directory
        if (!File(filePath).existsSync()) {
          print("File does not exist. Loading PDF from assets...");
          // Load PDF from assets
          ByteData data = await rootBundle.load(assetPath);
          print("Loaded PDF from assets: $fileName");

          // Convert ByteData to list of bytes
          List<int> bytes =
              data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

          // Write the PDF to the app's document directory
          print("Writing PDF to app's document directory...");
          await File(filePath).writeAsBytes(bytes);
          print("PDF written to $filePath");
        } else {
          print("File already exists in app's document directory.");
        }

        // Ensure the context is still mounted before navigation
        if (!context.mounted) return;

        // Navigate to PDF viewer screen
        print("Navigating to PDF viewer...");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PDFScreen(path: filePath)),
        );
      } catch (e) {
        print("Error opening PDF: $e");

        // Show an error message in case of failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to open PDF: $e')),
        );
      }
    }

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Tap a lecture to view the PDF",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 600,
              child: ListView.builder(
                  itemCount: lectures.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      elevation: 16,
                      shadowColor: Colors.red,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tileColor: Colors.redAccent,
                        horizontalTitleGap: 20,
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        leading: const Icon(Icons.picture_as_pdf),
                        title: Text(lectures[index].title),
                        onTap: () {
                          openPDF(context, lectures[index].fileName);
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
