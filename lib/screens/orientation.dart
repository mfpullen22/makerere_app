import "package:flutter/material.dart";
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
      String path = (await getApplicationDocumentsDirectory()).path;
      String assetPath = 'assets/pdfs/$fileName';
      String filePath = '$path/$fileName';

      if (!File(filePath).existsSync()) {
        ByteData data = await rootBundle.load(assetPath);
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(filePath).writeAsBytes(bytes);
      }
      if (!context.mounted) {
        return;
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PDFScreen(path: filePath)));
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


/* [
          const Text("Orientation Screen"),
          ElevatedButton(
            onPressed: () {
              openPDF(context, "bioterror.pdf");
            },
            child: const Text("Bioterror Lecture"),
          ),
        ], */