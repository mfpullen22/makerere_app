// ignore_for_file: use_build_context_synchronously

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:intl/intl.dart';
import "package:flutter/material.dart";
import "package:makerere_app/screens/survey_pages/interpersonal_skills.dart";
import "package:makerere_app/screens/survey_pages/medical_knowledge.dart";
import "package:makerere_app/screens/survey_pages/patient_care.dart";
import "package:makerere_app/screens/survey_pages/practice_based_learning.dart";
import "package:makerere_app/screens/survey_pages/professionalism.dart";
import "package:makerere_app/screens/survey_pages/review_instructions.dart";
import "package:makerere_app/screens/survey_pages/score_summary.dart";
import "package:makerere_app/screens/survey_pages/systems_based_practice.dart";

class AddSurveyScreen extends StatefulWidget {
  const AddSurveyScreen({super.key});

  @override
  State<AddSurveyScreen> createState() => _AddSurveyScreenState();
}

class _AddSurveyScreenState extends State<AddSurveyScreen> {
  int currentPage = 0;
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
  final List<Widget> pages = [];

  // Form field controllers
  String? reviewDepartment;
  Map patientCare = {
    "pc1": 1,
    "pc1Comments": "",
    "pc2": 1,
    "pc2Comments": "",
    "pc3": 1,
    "pc3Comments": "",
    "pc4": 1,
    "pc4Comments": "",
    "pc5": 1,
    "pc5Comments": ""
  };
  Map medicalKnowledge = {
    "mk1": 1,
    "mk1Comments": "",
    "mk2": 1,
    "mk2Comments": ""
  };
  Map systemsBasedPractice = {
    "sbp1": 1,
    "sbp1Comments": "",
    "sbp2": 1,
    "sbp2Comments": "",
    "sbp3": 1,
    "sbp3Comments": "",
    "sbp4": 1,
    "sbp4Comments": ""
  };
  Map practiceBasedLearning = {
    "pbl1": 1,
    "pbl1Comments": "",
    "pbl2": 1,
    "pbl2Comments": "",
    "pbl3": 1,
    "pbl3Comments": "",
    "pbl4": 1,
    "pbl4Comments": ""
  };
  Map professionalism = {
    "prof1": 1,
    "prof1Comments": "",
    "prof2": 1,
    "prof2Comments": "",
    "prof3": 1,
    "prof3Comments": "",
    "prof4": 1,
    "prof4Comments": ""
  };
  Map interpersonal = {
    "ics1": 1,
    "ics1Comments": "",
    "ics2": 1,
    "ics2Comments": "",
    "ics3": 1,
    "ics3Comments": ""
  };

  @override
  void initState() {
    super.initState();
    fetchStudents();
    fetchReviewer();
    pages.addAll(
      [
        ReviewInstructions(onContinue: () {
          setState(() {
            currentPage++;
          });
        }),
        PatientCareReview(onBack: (results) {
          setState(() {
            patientCare = results;
            currentPage--;
          });
        }, onContinue: (results) {
          setState(() {
            patientCare = results;
            currentPage++;
          });
        }),
        MedicalKnowledgeReview(onBack: (results) {
          setState(() {
            medicalKnowledge = results;
            currentPage--;
          });
        }, onContinue: (results) {
          setState(() {
            medicalKnowledge = results;
            currentPage++;
          });
        }),
        SystemsBasedPractice(onBack: (results) {
          setState(() {
            systemsBasedPractice = results;
            currentPage--;
          });
        }, onContinue: (results) {
          setState(() {
            systemsBasedPractice = results;
            currentPage++;
          });
        }),
        PracticeBasedLearning(onBack: (results) {
          setState(() {
            practiceBasedLearning = results;
            currentPage--;
          });
        }, onContinue: (results) {
          setState(() {
            practiceBasedLearning = results;
            currentPage++;
          });
        }),
        Professionalism(onBack: (results) {
          setState(() {
            professionalism = results;
            currentPage--;
          });
        }, onContinue: (results) {
          setState(() {
            professionalism = results;
            currentPage++;
          });
        }),
        InterpersonalCommunicationSkills(onBack: (results) {
          setState(() {
            interpersonal = results;
            currentPage--;
          });
        }, onContinue: (results) {
          setState(() {
            interpersonal = results;
            currentPage++;
          });
        })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text('Submit Review', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown to select student
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<DocumentSnapshot>(
                  hint: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Select a Student")),
                  value: selectedStudent,
                  items: students.map((student) {
                    return DropdownMenuItem<DocumentSnapshot>(
                      value: student,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                            "${student['lastname']}, ${student['firstname']}"),
                      ),
                    );
                  }).toList(),
                  onChanged: (DocumentSnapshot? student) {
                    setState(() {
                      selectedStudent = student;
                    });
                  },
                ),
              ),
            ),

            // Show form when a student is selected
            if (selectedStudent != null) ...[
              Form(
                key: _formKey,
                child: Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton(
                            hint: const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("Select the rotation"),
                            ),
                            value: reviewDepartment,
                            items: departments.map((department) {
                              return DropdownMenuItem<String>(
                                value: department,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(department),
                                ),
                              );
                            }).toList(),
                            onChanged: (department) {
                              setState(() {
                                reviewDepartment = department;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: IndexedStack(index: currentPage, children: [
                          ...pages,
                          ScoreSummary(
                            results: {
                              "patientCare": patientCare,
                              "medicalKnowledge": medicalKnowledge,
                              "systemsBasedPractice": systemsBasedPractice,
                              "practiceBasedLearning": practiceBasedLearning,
                              "professionalism": professionalism,
                              "interpersonal": interpersonal,
                            },
                          ),
                        ]),
                      ),
                      /*           
                      Text('Current value: $sliderValue'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: submitReview,
                        child: const Text("Submit Review"),
                      ), */
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
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
      // ignore: avoid_print
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
    if (selectedStudent == null || reviewDepartment == null) {
      // Show a snackbar if any required field is not filled out
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete the entire survey')),
      );
      return; // Exit the function early if validation fails
    }

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
        setState(() {
          selectedStudent = null;
        });
      } catch (e) {
        // Handle the error and show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit review: $e')),
        );
        // ignore: avoid_print
        print('Error submitting review: $e');
      }
    }
  }
}
