import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makerere_app/screens/view_surveys.dart';

class ListSurveysScreen extends StatefulWidget {
  const ListSurveysScreen({super.key});

  @override
  State<ListSurveysScreen> createState() => _ListSurveysScreenState();
}

class _ListSurveysScreenState extends State<ListSurveysScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  List<Map<String, dynamic>> reviews = [];
  String? fullName;
  String? userRole;

  @override
  void initState() {
    super.initState();
    fetchUserRole(); // Fetch role first, then call fetchUserAndReviews
  }

  Future<void> fetchUserRole() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      // Fetch the user's document from Firestore using the email field
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: user.email) // Query by email
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final userDoc = snapshot.docs.first;
        setState(() {
          userRole = userDoc['role'];
          fullName = "${userDoc['firstname']} ${userDoc['lastname']}";
        });

        // Now that the role is set, fetch the reviews
        await fetchUserAndReviews();
      } else {
        setState(() {
          userRole = null;
        });
      }
    } catch (e) {}
  }

  Future<void> fetchUserAndReviews() async {
    if (currentUser == null) {
      return;
    }

    try {
      // Fetch the current user's document from Firestore based on email
      String email = currentUser!.email!;

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = snapshot.docs.first;

        // Based on the role, fetch relevant reviews
        if (userRole == 'student') {
          List<dynamic> userReviews = userDoc['reviews'] ?? [];

          // Filter reviews with a non-empty timestamp
          setState(() {
            reviews = userReviews
                .where(
                  (review) =>
                      review != null &&
                      review['timestamp'] != null &&
                      review['timestamp'].toString().isNotEmpty,
                )
                .cast<Map<String, dynamic>>()
                .toList();
          });
        } else if (userRole == 'faculty') {
          // Fetch all students and filter their reviews where 'reviewer' matches faculty's full name
          QuerySnapshot studentSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .where('role', isEqualTo: 'student')
              .get();

          List<Map<String, dynamic>> facultyReviews = [];

          for (var studentDoc in studentSnapshot.docs) {
            List<dynamic> studentReviews = studentDoc['reviews'] ?? [];

            facultyReviews.addAll(
              studentReviews
                  .where(
                    (review) =>
                        review != null &&
                        review['reviewer'] == fullName &&
                        review['timestamp'] != null &&
                        review['timestamp'].toString().isNotEmpty,
                  )
                  .cast<Map<String, dynamic>>()
                  .toList(),
            );
          }

          setState(() {
            reviews = facultyReviews;
          });
        } else {}
      } else {}
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white, // White back button
        ),
      ),
      body: reviews.isEmpty
          ? const Center(child: Text('No reviews found'))
          : ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                var review = reviews[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black),
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
                          builder: (context) => ViewSurveysScreen(
                            results: review,
                            role: userRole!,
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
