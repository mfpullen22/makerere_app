import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'meeting_detail_screen.dart';

class StudentMeetingListScreen extends StatelessWidget {
  final dynamic studentDoc;

  const StudentMeetingListScreen({super.key, required this.studentDoc});

  @override
  Widget build(BuildContext context) {
    final meetings =
        List<Map<String, dynamic>>.from(studentDoc['meetings'] ?? []);

    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${studentDoc['firstname']} ${studentDoc['lastname']} Meetings')),
      body: meetings.isEmpty
          ? const Center(child: Text('No meetings found'))
          : ListView.builder(
              itemCount: meetings.length,
              itemBuilder: (context, index) {
                final meeting = meetings[index];
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
                    : 'Unknown Date';

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black),
                  ),
                  elevation: 16,
                  child: ListTile(
                    title: Text(meeting['metWith'] ?? 'Unknown'),
                    subtitle: Text(dateStr),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MeetingDetailScreen(
                            metWith: meeting['metWith'] ?? 'Unknown',
                            date: dateStr,
                            note: meeting['notes'] ?? '',
                          ),
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
