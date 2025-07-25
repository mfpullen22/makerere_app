import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MeetingFormScreen extends StatefulWidget {
  const MeetingFormScreen({Key? key}) : super(key: key);

  @override
  MeetingFormScreenState createState() => MeetingFormScreenState();
}

class MeetingFormScreenState extends State<MeetingFormScreen> {
  final TextEditingController _metWithController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _metWithController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _submitMeeting() async {
    // 1. Get the current user from Firebase Auth.
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Handle the case if the user is not logged in
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No user is currently signed in.')),
      );
      return;
    }

    final String userEmail = user.email ?? '';

    // 2. Prepare the meeting data as a map.
    final Map<String, dynamic> meetingData = {
      'metWith': _metWithController.text.trim(),
      'date': _selectedDate?.toIso8601String() ?? '',
      'notes': _notesController.text.trim(),
    };

    try {
      // 3. Find the user document in Firestore via the `email` field.
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final DocumentReference userDocRef = querySnapshot.docs.first.reference;

        // 4. Use FieldValue.arrayUnion to add the meeting to the "meetings" array.
        await userDocRef.update({
          'meetings': FieldValue.arrayUnion([meetingData]),
        });

        // Provide feedback on success
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Meeting submitted successfully!')),
        );

        // Optionally clear the fields
        _metWithController.clear();
        _notesController.clear();
        setState(() {
          _selectedDate = null;
        });
      } else {
        // If the document doesn’t exist, you might handle that scenario differently.
        // For instance, you could create a new user document here.
        // This example simply shows a message.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No matching user document found.')),
        );
      }
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting meeting: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record a Meeting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Who they met with
            TextFormField(
              controller: _metWithController,
              decoration: const InputDecoration(
                labelText: 'Met With',
              ),
            ),

            const SizedBox(height: 16),

            // Meeting date
            InkWell(
              onTap: () => _pickDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Meeting Date',
                  border: OutlineInputBorder(),
                ),
                child: Text(
                  _selectedDate == null
                      ? 'Select Date'
                      : _selectedDate!.toLocal().toString().split(' ')[0],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Meeting notes
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Meeting Notes',
              ),
              maxLines: 5,
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _submitMeeting,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
