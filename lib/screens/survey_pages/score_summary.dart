import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:makerere_app/widgets/view_survey.dart";

class ScoreSummary extends StatefulWidget {
  const ScoreSummary({
    super.key,
    required this.results,
    required this.selectedStudent,
    required this.reviewDepartment,
    required this.reviewer,
    required this.onSuccess,
  });

  final Map<String, dynamic> results;
  final DocumentSnapshot? selectedStudent;
  final String? reviewDepartment;
  final String reviewer;
  final Function onSuccess;

  @override
  State<ScoreSummary> createState() => _ScoreSummaryState();
}

class _ScoreSummaryState extends State<ScoreSummary> {
  void submitReview() async {
    if (widget.selectedStudent == null || widget.reviewDepartment == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Select a student and department at the top of the page.',
          ),
        ),
      );
      return;
    }

    String studentId = widget.selectedStudent!.id;
    String studentFirstname = widget.selectedStudent!['firstname'];
    String studentLastname = widget.selectedStudent!['lastname'];

    try {
      DateTime now = DateTime.now();
      String formattedTimestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      Map<String, dynamic> review = {
        "timestamp": formattedTimestamp,
        "studentId": studentId, // Use only the student ID
        "studentFirstname": studentFirstname, // Store relevant student details
        "studentLastname": studentLastname,
        "reviewer": widget.reviewer,
        "department": widget.reviewDepartment,
        "patientCare": widget.results["patientCare"],
        "medicalKnowledge": widget.results["medicalKnowledge"],
        "professionalism": widget.results["professionalism"],
        "interpersonal": widget.results["interpersonal"],
        "practiceBasedLearning": widget.results["practiceBasedLearning"],
        "systemsBasedPractice": widget.results["systemsBasedPractice"],
      };

      // Add the review to the 'reviews' array of the selected student
      await FirebaseFirestore.instance
          .collection('users')
          .doc(studentId)
          .update({
        "reviews": FieldValue.arrayUnion([review]),
      });

      // Show confirmation and reset form
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Review submitted successfully')),
      );
      setState(() {
        widget.onSuccess();
      });
    } catch (e) {
      // Handle the error and show an error message
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to submit review: $e')));
      // ignore: avoid_print
      print('Error submitting review: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ViewSurvey(results: widget.results, role: "faculty"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  print(widget.results);
                },
                child: const Text("TEST PRINT"),
              ),
              const SizedBox(width: 50),
              ElevatedButton(
                onPressed: () {
                  submitReview();
                },
                child: const Text("Submit Review"),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
