import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LectureAttendanceScreen extends StatefulWidget {
  const LectureAttendanceScreen({super.key});

  @override
  State<LectureAttendanceScreen> createState() =>
      _LectureAttendanceScreenState();
}

class _LectureAttendanceScreenState extends State<LectureAttendanceScreen> {
  bool isLoading = true;
  bool canRecordAttendance = false;
  List<Map<String, dynamic>> students = [];
  Set<String> selectedStudents = {};

  DateTime? selectedDate;
  final TextEditingController _lectureTitleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkUserPermission();
  }

  Future<void> _checkUserPermission() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final email = user.email;
    final userQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (userQuery.docs.isEmpty) {
      setState(() {
        isLoading = false;
        canRecordAttendance = false;
      });
      return;
    }

    final userData = userQuery.docs.first.data();
    final allowed = userData['attendance'] == true;

    if (allowed) {
      await _fetchStudents();
    }

    setState(() {
      canRecordAttendance = allowed;
      isLoading = false;
    });
  }

  Future<void> _fetchStudents() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    students = snapshot.docs
        .map((doc) => doc.data())
        .where((data) =>
            data.containsKey('firstname') && data.containsKey('lastname'))
        .toList();
    students.sort((a, b) => (a['lastname'] + a['firstname'])
        .compareTo(b['lastname'] + b['firstname']));
  }

  void _submitAttendance() async {
    if (selectedDate == null || _lectureTitleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a date and lecture title.')),
      );
      return;
    }

    final formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate!);
    final attended = selectedStudents.toList();
    final allStudentNames =
        students.map((s) => "${s['firstname']} ${s['lastname']}").toList();
    final notAttended =
        allStudentNames.where((name) => !attended.contains(name)).toList();

    await FirebaseFirestore.instance.collection('attendance').add({
      'date': formattedDate,
      'lectureTitle': _lectureTitleController.text.trim(),
      'attendance': {
        'attended': attended,
        'not_attended': notAttended,
      },
    });

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Attendance submitted successfully.')),
    );

    _lectureTitleController.clear();
    selectedDate = null;
    selectedStudents.clear();
    setState(() {});
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!canRecordAttendance) {
      return const Padding(
        padding: EdgeInsets.all(24.0),
        child: Center(
          child: Text(
            "You are not an attendance captain.\nIf you believe this is an error, please contact an administrator in the Medicine Clerkship office.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Record Lecture Attendance'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _lectureTitleController,
              decoration: const InputDecoration(
                labelText: 'Lecture Title',
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _pickDate,
                  child: const Text("Pick Date"),
                ),
                const SizedBox(width: 12),
                Text(
                  selectedDate != null
                      ? DateFormat('MM-dd-yyyy').format(selectedDate!)
                      : "No date selected",
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "Select Attendees:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (ctx, index) {
                  final fullName =
                      "${students[index]['firstname']} ${students[index]['lastname']}";
                  final isSelected = selectedStudents.contains(fullName);
                  return ListTile(
                    title: Text(fullName),
                    trailing: isSelected
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : const Icon(Icons.radio_button_unchecked),
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedStudents.remove(fullName);
                        } else {
                          selectedStudents.add(fullName);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _submitAttendance,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text("Submit Attendance"),
            ),
          ],
        ),
      ),
    );
  }
}
