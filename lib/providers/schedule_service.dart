import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// Maps each rotation field to a corresponding schedule period date range.
/// Adjust these date ranges as needed.
final rotationPeriods = [
  {"field": "rotation1", "title": "12th Aug - 8th Sept 2024"},
  {"field": "rotation2", "title": "9th Sept - 29th Sept 2024"},
  {"field": "rotation3", "title": "30th Sept - 27th Oct 2024"},
  {"field": "rotation4", "title": "28th Oct - 15th Nov 2024"},
  {"field": "rotation5", "title": "20th Jan - 16th Feb 2025"},
  {"field": "rotation6", "title": "17th Feb - 9th March 2025"},
  {"field": "rotation7", "title": "10th March - 6th April 2025"},
  {"field": "rotation8", "title": "7th April - 26th April 2025"},
];

Widget getScheduleByRotation(String rotation) {
  // For each rotation period, we run a query to find students who have that rotation in that period
  final futures = rotationPeriods.map((period) {
    return FirebaseFirestore.instance
        .collection("users")
        .where("schedule.${period["field"]}", isEqualTo: rotation)
        .get();
  }).toList();

  return FutureBuilder<List<QuerySnapshot<Map<String, dynamic>>>>(
    future: Future.wait(futures),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (snapshot.hasError) {
        return const Center(
          child: Text('An error occurred'),
        );
      }

      if (!snapshot.hasData) {
        return const Center(
          child: Text('No data found'),
        );
      }

      final queryResults = snapshot.data!;
      // queryResults[i] corresponds to rotationPeriods[i]

      // We will build a ListView of sections: one for each rotation period.
      // Each section shows a heading (the date range) and a list of students, or "No students".
      return ListView.builder(
        itemCount: rotationPeriods.length,
        itemBuilder: (context, index) {
          final period = rotationPeriods[index];
          final docs = queryResults[index].docs;

          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Period heading
                Text(
                  period["title"] as String,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                if (docs.isEmpty)
                  const Text("No students found for this rotation period")
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: docs.map((doc) {
                      final data = doc.data();
                      final firstname = data["firstname"] ?? "";
                      final lastname = data["lastname"] ?? "";
                      return Text("$firstname $lastname");
                    }).toList(),
                  ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget getScheduleByStudent(String lastName) {
  return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
    future: FirebaseFirestore.instance
        .collection("users")
        .where("lastname", isEqualTo: lastName)
        .get(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (snapshot.hasError) {
        return const Center(
          child: Text('An error occurred'),
        );
      }

      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return const Center(
          child: Text('No data found for this student'),
        );
      }

      final rotationSchedule = snapshot.data!.docs;

      return ListView.builder(
        itemCount: rotationSchedule.length,
        itemBuilder: (context, index) {
          final rotation = rotationSchedule[index].data();
          if (rotation["class"] == "mmed2") {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "12th Aug - 8th Sept 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation1"]),
                const SizedBox(height: 10),
                const Text(
                  "9th Sept - 29th Sept 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation2"]),
                const SizedBox(height: 10),
                const Text(
                  "30th Sept - 27th Oct 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation3"]),
                const SizedBox(height: 10),
                const Text(
                  "28th Oct - 15th Nov 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation4"]),
                const SizedBox(height: 10),
                const Text(
                  "20th Jan - 16th Feb 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation5"]),
                const SizedBox(height: 10),
                const Text(
                  "17th Feb - 9th March 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation6"]),
                const SizedBox(height: 10),
                const Text(
                  "10th March - 6th April 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation7"]),
                const SizedBox(height: 10),
                const Text(
                  "7th April - 26th April 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation8"]),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "12th Aug - 29th Sept 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation1"]),
                const SizedBox(height: 10),
                const Text(
                  "30th Sept - 15th Nov 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation3"]),
                const SizedBox(height: 10),
                const Text(
                  "20th Jan - 9th March 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation5"]),
                const SizedBox(height: 10),
                const Text(
                  "10th March - 26th April 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation7"]),
              ],
            );
          }
        },
      );
    },
  );
}
