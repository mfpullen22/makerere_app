import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String firstName;
  final String lastName;
  final List reviews;

  User(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.reviews});

  factory User.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;
    return User(
      email: data["email"],
      firstName: data['firstname'],
      lastName: data['lastname'],
      reviews: data['reviews'] ?? [],
    );
  }
}
