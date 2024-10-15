import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
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
  String reviewer = FirebaseAuth.instance.currentUser!.uid;

  // Form field controllers
  TextEditingController question1Controller = TextEditingController();
  TextEditingController question2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchStudents();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Review')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown to select student
            DropdownButton<DocumentSnapshot>(
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

            // Show form when a student is selected
            if (selectedStudent != null) ...[
              Form(
                key: _formKey,
                child: Column(
                  children: [
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

  // Function to submit the review
  void submitReview() async {
    if (_formKey.currentState!.validate()) {
      try {
        Map<String, dynamic> review = {
          "timestamp": FieldValue.serverTimestamp().toString(),
          "reviewer": reviewer,
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
}
