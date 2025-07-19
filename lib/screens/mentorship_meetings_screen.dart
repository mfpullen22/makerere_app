import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:csv/csv.dart';

import 'student_meeting_list_screen.dart';

class MentorshipMeetingsScreen extends StatefulWidget {
  const MentorshipMeetingsScreen({super.key});

  @override
  State<MentorshipMeetingsScreen> createState() =>
      _MentorshipMeetingsScreenState();
}

class _MentorshipMeetingsScreenState extends State<MentorshipMeetingsScreen> {
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
      students.sort((a, b) =>
          (a['lastname'] as String).compareTo(b['lastname'] as String));
    });
  }

  Future<void> _exportMeetings() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    final List<List<dynamic>> csvRows = [
      ['Student Name', 'Met With', 'Date', 'Note']
    ];

    for (final doc in snapshot.docs) {
      final data = doc.data();
      final meetings = List<Map<String, dynamic>>.from(data['meetings'] ?? []);
      final studentName = "${data['firstname']} ${data['lastname']}";

      for (final meeting in meetings) {
        final metWith = meeting['metWith'] ?? '';
        final note = meeting['notes'] ?? '';
        DateTime? date;
        final rawDate = meeting['date'];
        if (rawDate is Timestamp) {
          date = rawDate.toDate();
        } else if (rawDate is String) {
          try {
            date = DateTime.parse(rawDate);
          } catch (_) {
            date = null;
          }
        } else {
          date = null;
        }
        final dateStr = date != null
            ? "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}"
            : '';

        csvRows.add([studentName, metWith, dateStr, note]);
      }
    }

    final csv = const ListToCsvConverter().convert(csvRows);

    final emailController = TextEditingController();
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Export Mentorship Meetings'),
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
                  await FirebaseFunctions.instance
                      .httpsCallable('sendReviewEmailWithMailgun')
                      .call({
                    'email': email,
                    'csv': csv,
                  });
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email sent successfully.')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to send email: $e')),
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
      appBar: AppBar(title: const Text("Mentorship Meetings")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _exportMeetings,
              child: const Text('Export all meetings'),
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
                    title:
                        Text('${student['firstname']} ${student['lastname']}'),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            StudentMeetingListScreen(studentDoc: student),
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
