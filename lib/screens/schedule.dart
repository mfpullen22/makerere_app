import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  Future<QuerySnapshot<Map<String, dynamic>>> getRotationSchedule() async {
    final rotationSchedule = await FirebaseFirestore.instance
        .collection("users")
        .where("schedule.rotation1", isEqualTo: "Infectious Diseases")
        .get();
    return rotationSchedule;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: getRotationSchedule(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final rotationSchedule = snapshot.data!.docs;
        print(rotationSchedule);
        return ListView.builder(
          itemCount: rotationSchedule.length,
          itemBuilder: (context, index) {
            final rotation = rotationSchedule[index];
            return ListTile(
              title: Text(rotation["firstname"] + " " + rotation["lastname"]),
            );
          },
        );
      },
    );
  }
}
