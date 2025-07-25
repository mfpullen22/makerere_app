import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import "package:makerere_app/main.dart";

import 'pdf.dart';

class PresentationListScreen extends StatefulWidget {
  const PresentationListScreen({super.key});

  @override
  State<PresentationListScreen> createState() => _PresentationListScreenState();
}

class _PresentationListScreenState extends State<PresentationListScreen> {
  bool _isLoading = false;

  Future<void> openPDF(
    BuildContext context,
    String storageUrl,
    String fileName,
  ) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/$fileName';
      final localFile = File(filePath);

      // Debugging file existence

      // Download the file if it doesn't exist
      if (!localFile.existsSync()) {
        await _downloadPDF(storageUrl, localFile);
      }

      // Confirm the file is valid before navigation
      if (!localFile.existsSync() || localFile.lengthSync() == 0) {
        throw Exception("File is missing or invalid after download.");
      }

      // Navigate to the PDF viewer
      navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => PDFScreen(path: filePath)),
      );
    } catch (e) {
      // Show error message using the global scaffold messenger
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text('Failed to open PDF: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _downloadPDF(String storageUrl, File localFile) async {
    try {
      final dir = localFile.parent;

      // Ensure the directory exists
      if (!dir.existsSync()) {
        dir.createSync(recursive: true);
      }

      // Ensure the file is explicitly created
      if (!localFile.existsSync()) {
        localFile.createSync();
      }

      final ref = FirebaseStorage.instance.refFromURL(storageUrl);
      final bytes = await ref.getData();

      if (bytes == null || bytes.isEmpty) {
        throw Exception("Failed to download PDF or received empty data.");
      }

      await localFile.writeAsBytes(bytes, flush: true);
    } on FileSystemException catch (e) {
      throw Exception("Failed to write PDF to local storage: ${e.message}");
    } catch (e) {
      throw Exception("Download failed: $e");
    }
  }

  Future<Uint8List> _fetchPDFBytes(String storageUrl) async {
    final ref = FirebaseStorage.instance.refFromURL(storageUrl);
    final bytes = await ref.getData();
    if (bytes == null) {
      throw Exception("Failed to download PDF from Firebase Storage.");
    }
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Tap a presentation to view the PDF",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 600,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('presentations')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text(
                            'No presentations available',
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }

                      // Fetch and sort documents alphabetically by title
                      final docs = snapshot.data!.docs;
                      docs.sort((a, b) {
                        final titleA = (a.data()
                            as Map<String, dynamic>)['title'] as String;
                        final titleB = (b.data()
                            as Map<String, dynamic>)['title'] as String;
                        return titleA.toLowerCase().compareTo(
                              titleB.toLowerCase(),
                            );
                      });

                      return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          final data =
                              docs[index].data() as Map<String, dynamic>;
                          final title = data['title'] as String;
                          final storageUrl = data['url'] as String;

                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.black),
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
                              title: Text(title),
                              onTap: () {
                                openPDF(context, storageUrl, '$title.pdf');
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isLoading)
          Container(
            color: Colors.black.withValues(alpha: 0.5),
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}



/* import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makerere_app/models/lectures.dart';
import 'package:makerere_app/screens/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PresentationListScreen extends StatelessWidget {
  const PresentationListScreen({super.key});

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
 */