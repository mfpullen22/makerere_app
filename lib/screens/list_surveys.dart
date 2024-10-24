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
        print("No user logged in.");
        return;
      }

      print("Fetching role for user with email: ${user.email}");

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
        print("User role is $userRole, full name is $fullName");

        // Now that the role is set, fetch the reviews
        await fetchUserAndReviews();
      } else {
        print("No user document found for the current user's email.");
        setState(() {
          userRole = null;
        });
      }
    } catch (e) {
      print("Error fetching user role: $e");
    }
  }

  Future<void> fetchUserAndReviews() async {
    if (currentUser == null) {
      print("No current user.");
      return;
    }

    try {
      // Fetch the current user's document from Firestore based on email
      String email = currentUser!.email!;
      print("Fetching document for user with email: $email");

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot userDoc = snapshot.docs.first;

        // Based on the role, fetch relevant reviews
        if (userRole == 'student') {
          print("Fetching reviews for student");
          List<dynamic> userReviews = userDoc['reviews'] ?? [];
          print("User reviews: $userReviews");

          // Filter reviews with a non-empty timestamp
          setState(() {
            reviews = userReviews
                .where((review) =>
                    review != null &&
                    review['timestamp'] != null &&
                    review['timestamp'].toString().isNotEmpty)
                .cast<Map<String, dynamic>>()
                .toList();
          });
          print("Filtered student reviews: $reviews");
        } else if (userRole == 'faculty') {
          print("Fetching reviews for faculty");

          // Fetch all students and filter their reviews where 'reviewer' matches faculty's full name
          QuerySnapshot studentSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .where('role', isEqualTo: 'student')
              .get();

          List<Map<String, dynamic>> facultyReviews = [];

          for (var studentDoc in studentSnapshot.docs) {
            List<dynamic> studentReviews = studentDoc['reviews'] ?? [];
            print("Student reviews for doc: $studentReviews");

            facultyReviews.addAll(
              studentReviews
                  .where((review) =>
                      review != null &&
                      review['reviewer'] == fullName &&
                      review['timestamp'] != null &&
                      review['timestamp'].toString().isNotEmpty)
                  .cast<Map<String, dynamic>>()
                  .toList(),
            );
          }

          setState(() {
            reviews = facultyReviews;
          });
          print("Filtered faculty reviews: $reviews");
        } else {
          print("User role not recognized or no reviews found.");
        }
      } else {
        print("No user document found for the current user with email $email");
      }
    } catch (e) {
      print("Error fetching reviews: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reviews',
          style: TextStyle(color: Colors.white),
        ),
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
                          builder: (context) => ViewSurveysScreen(
                              results: review, role: userRole!),
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
