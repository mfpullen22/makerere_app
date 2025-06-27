// student_review_list_screen.dart
import 'package:flutter/material.dart';
import 'package:makerere_app/screens/view_surveys.dart';

class StudentReviewListScreen extends StatelessWidget {
  final dynamic studentDoc;

  const StudentReviewListScreen({super.key, required this.studentDoc});

  @override
  Widget build(BuildContext context) {
    final reviews =
        List<Map<String, dynamic>>.from(studentDoc['reviews'] ?? []);

    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${studentDoc['firstname']} ${studentDoc['lastname']} Reviews')),
      body: reviews.isEmpty
          ? const Center(child: Text('No reviews found'))
          : ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                if (review['timestamp'] == null ||
                    review['timestamp'].toString().isEmpty) {
                  return const SizedBox.shrink(); // Skip empty reviews
                }
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  elevation: 16,
                  child: ListTile(
                    title: Text('Rotation: ${review['department']}'),
                    subtitle: Text('Review Date: ${review['timestamp']}'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ViewSurveysScreen(results: review, role: "admin"),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
