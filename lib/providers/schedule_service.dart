import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

Widget getScheduleByYear(String year) {
  //var classYear = "Select Class";

  return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
    future: FirebaseFirestore.instance
        .collection("users")
        .where("class", isEqualTo: year)
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
          child: Text('No data found for this year'),
        );
      }

      final rotationSchedule = snapshot.data!.docs;

      return ListView.builder(
        itemCount: rotationSchedule.length,
        itemBuilder: (context, index) {
          final rotation = rotationSchedule[index].data();
          return ListTile(
            title: Text('${rotation["firstname"]} ${rotation["lastname"]}'),
          );
        },
      );
    },
  );
}

Widget getScheduleByStudent(lastName) {
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
              children: [
                const Text(
                  "12th Aug - 8th Sept 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation1"]),
                const Text(
                  "9th Sept - 29th Sept 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation2"]),
                const Text(
                  "30th Sept - 27th Oct 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation3"]),
                const Text(
                  "28th Oct - 15th Nov 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation4"]),
                const Text(
                  "20th Jan - 16th Feb 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation5"]),
                const Text(
                  "17th Feb - 9th March 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation6"]),
                const Text(
                  "10th March - 6th April 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation7"]),
                const Text(
                  "7th April - 26th April 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation8"]),
              ],
            );
          } else {
            return Column(
              children: [
                const Text(
                  "12th Aug - 29th Sept 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation1"]),
                const Text(
                  "30th Sept - 15th Nov 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation3"]),
                const Text(
                  "20th Jan - 9th March 2025",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(rotation["schedule"]["rotation5"]),
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

/* Widget getScheduleByRotation(rotation) {
  return null;
}
 */