import 'package:flutter/material.dart';
import 'package:makerere_app/screens/attendance_captain_screen.dart';
import 'package:makerere_app/screens/mentorship_meetings_screen.dart';
import 'student_reviews_screen.dart';

class AdminTasksScreen extends StatelessWidget {
  const AdminTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Tasks')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const StudentReviewsScreen()),
                  ),
                  child: const Text('View Student Reviews'),
                ),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MentorshipMeetingsScreen(),
                    ),
                  ),
                  child: const Text('View Mentorship Meetings'),
                ),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('View Attendance'),
                ),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AssignAttendanceCaptainsScreen(),
                    ),
                  ),
                  child: const Text('Choose Attendance Captains'),
                ),
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Edit Student Records'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
