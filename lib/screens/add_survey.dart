import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:intl/intl.dart';
import "package:flutter/material.dart";

class AddSurveyScreen extends StatefulWidget {
  const AddSurveyScreen({super.key});

  @override
  State<AddSurveyScreen> createState() => _AddSurveyScreenState();
}

class _AddSurveyScreenState extends State<AddSurveyScreen> {
  List<DocumentSnapshot> students = [];
  DocumentSnapshot? selectedStudent;
  final _formKey = GlobalKey<FormState>();
  String? reviewer;
  List<String> departments = [
    "Cardiology",
    "Dermatology",
    "Emergency - Mulago",
    "Endocrinology",
    "Gastroenterology",
    "Hematology",
    "ICU/Palliative Care",
    "IDI",
    "Infectious Diseases",
    "MLI",
    "Nephrology",
    "Neurology",
    "Pulmonology",
    "Radiology",
    "TB",
    "UCI",
    "UHI",
    "Ward 11"
  ];

  // Form field controllers
  String? reviewDepartment;
  TextEditingController question1Controller = TextEditingController();
  TextEditingController question2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchStudents();
    fetchReviewer();
  }

  Future<void> fetchReviewer() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String email = currentUser.email!;
        // Query Firestore for the user document that matches the email
        QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .limit(1)
            .get();

        if (snapshot.docs.isNotEmpty) {
          DocumentSnapshot userDoc = snapshot.docs.first;
          setState(() {
            reviewer = "${userDoc['firstname']} ${userDoc['lastname']}";
          });
        }
      }
    } catch (e) {
      print('Error fetching reviewer: $e');
    }
  }

  // Fetch students from Firestore and sort them alphabetically
  Future<void> fetchStudents() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      students = snapshot.docs;
      students.sort((a, b) => "${a['lastname']}, ${a['firstname']}"
          .compareTo("${b['lastname']}, ${b['firstname']}"));
    });
  }

  // Function to submit the review
  void submitReview() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Get the current date and time
        DateTime now = DateTime.now();
        // Format the timestamp as a string (e.g., "2024-10-15 14:30:00")
        String formattedTimestamp =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
        Map<String, dynamic> review = {
          "timestamp": formattedTimestamp,
          "reviewer": reviewer,
          "department": reviewDepartment,
          "question1": question1Controller.text,
          "question2": question2Controller.text,
        };

        // Add the review to the 'reviews' array of the selected student
        await FirebaseFirestore.instance
            .collection('users')
            .doc(selectedStudent!
                .id) // Use the document ID to reference the correct student
            .update({
          "reviews": FieldValue.arrayUnion([review]),
        });

        // Show confirmation and reset form
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Review submitted successfully')));
        question1Controller.clear();
        question2Controller.clear();
        setState(() {
          selectedStudent = null;
        });
      } catch (e) {
        // Handle the error and show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit review: $e')),
        );
        print('Error submitting review: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown to select student
            Center(
              child: DropdownButton<DocumentSnapshot>(
                hint: const Text("Select a Student"),
                value: selectedStudent,
                items: students.map((student) {
                  return DropdownMenuItem<DocumentSnapshot>(
                    value: student,
                    child:
                        Text("${student['lastname']}, ${student['firstname']}"),
                  );
                }).toList(),
                onChanged: (DocumentSnapshot? student) {
                  setState(() {
                    selectedStudent = student;
                  });
                  print(selectedStudent!.data());
                },
              ),
            ),

            // Show form when a student is selected
            if (selectedStudent != null) ...[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButton(
                      hint: const Text("Select the rotation"),
                      value: reviewDepartment,
                      items: departments.map((department) {
                        return DropdownMenuItem<String>(
                          value: department,
                          child: Text(department),
                        );
                      }).toList(),
                      onChanged: (department) {
                        setState(() {
                          reviewDepartment = department;
                        });
                      },
                    ),
                    TextFormField(
                      controller: question1Controller,
                      decoration:
                          const InputDecoration(labelText: "Question 1"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill out this field';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: question2Controller,
                      decoration:
                          const InputDecoration(labelText: "Question 2"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill out this field';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: submitReview,
                      child: const Text("Submit Review"),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
