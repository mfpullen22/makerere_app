import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:makerere_app/screens/student_review_details_screen.dart';

class StudentReviewsScreen extends StatefulWidget {
  const StudentReviewsScreen({super.key});

  @override
  State<StudentReviewsScreen> createState() => _StudentReviewsScreenState();
}

class _StudentReviewsScreenState extends State<StudentReviewsScreen> {
  List<QueryDocumentSnapshot> students = [];

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'student')
        .get();
    setState(() {
      students = snapshot.docs;
      students.sort(
        (a, b) => (a['lastname'] as String).compareTo(b['lastname'] as String),
      );
    });
  }

  Future<void> _exportReviews() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    final reviews = <List<dynamic>>[];
    final headers = <String>{};

    for (final doc in snapshot.docs) {
      final userReviews = List.from(doc['reviews'] ?? []);
      for (final review in userReviews) {
        final row = <String, dynamic>{};
        review.forEach((key, value) {
          if (value is Map) {
            value.forEach((subKey, subVal) {
              headers.add(subKey);
              row[subKey] = subVal;
            });
          } else {
            headers.add(key);
            row[key] = value;
          }
        });
        reviews.add(
          List.generate(
            headers.length,
            (index) => row[headers.elementAt(index)] ?? '',
          ),
        );
      }
    }

    final csvData = [headers.toList(), ...reviews];
    final csv = const ListToCsvConverter().convert(csvData);

    final emailController = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Export Reviews'),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'Enter your email'),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final email = emailController.text.trim();
              if (email.isNotEmpty) {
                try {
                  final result = await FirebaseFunctions.instance
                      .httpsCallable('sendReviewEmailWithMailgun')
                      .call({'email': email, 'csv': csv});
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email sent successfully.')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to send email: \$e')),
                  );
                }
              }
              Navigator.pop(context);
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Reviews')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _exportReviews,
              child: const Text('Export all Reviews'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black),
                  ),
                  elevation: 16,
                  child: ListTile(
                    title: Text(
                      '${student['firstname']} ${student['lastname']}',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            StudentReviewDetailsScreen(studentDoc: student),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
