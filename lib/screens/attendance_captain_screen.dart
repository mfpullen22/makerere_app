import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssignAttendanceCaptainsScreen extends StatefulWidget {
  const AssignAttendanceCaptainsScreen({super.key});

  @override
  State<AssignAttendanceCaptainsScreen> createState() =>
      _AssignAttendanceCaptainsScreenState();
}

class _AssignAttendanceCaptainsScreenState
    extends State<AssignAttendanceCaptainsScreen> {
  bool isLoading = true;
  List<Map<String, dynamic>> students = []; // full student objects
  Set<String> selectedStudentIds =
      {}; // store document IDs for toggled captains

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  Future<void> _loadStudents() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();

    final sortedStudents = snapshot.docs
        .where((doc) =>
            doc.data().containsKey('firstname') &&
            doc.data().containsKey('lastname'))
        .map((doc) {
      final data = doc.data();
      return {
        'id': doc.id,
        'firstname': data['firstname'],
        'lastname': data['lastname'],
        'attendance': data['attendance'] ?? false,
      };
    }).toList()
      ..sort((a, b) => (a['lastname'] + a['firstname'])
          .compareTo(b['lastname'] + b['firstname']));

    setState(() {
      students = sortedStudents;
      selectedStudentIds = sortedStudents
          .where((s) => s['attendance'] == true)
          .map((s) => s['id'].toString())
          .toSet();
      isLoading = false;
    });
  }

  Future<void> _submitChanges() async {
    setState(() => isLoading = true);

    final batch = FirebaseFirestore.instance.batch();

    for (final student in students) {
      final docRef =
          FirebaseFirestore.instance.collection('users').doc(student['id']);
      final shouldBeCaptain = selectedStudentIds.contains(student['id']);

      batch.update(docRef, {'attendance': shouldBeCaptain});
    }

    await batch.commit();

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Attendance captain assignments updated.")),
    );

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assign Attendance Captains"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Tap to select or deselect students as attendance captains:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (ctx, index) {
                        final student = students[index];
                        final fullName =
                            "${student['firstname']} ${student['lastname']}";
                        final isSelected =
                            selectedStudentIds.contains(student['id']);

                        return ListTile(
                          title: Text(fullName),
                          trailing: isSelected
                              ? const Icon(Icons.check_circle,
                                  color: Colors.green)
                              : const Icon(Icons.radio_button_unchecked),
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedStudentIds.remove(student['id']);
                              } else {
                                selectedStudentIds.add(student['id']);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _submitChanges,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: const Text("Submit Changes"),
                  ),
                ],
              ),
            ),
    );
  }
}
