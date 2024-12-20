import "package:flutter/material.dart";
import "package:makerere_app/screens/add_survey.dart";
import "package:makerere_app/screens/list_surveys.dart";
import "package:makerere_app/screens/presentation_list.dart";
import "package:makerere_app/screens/schedule.dart";

class HomeScreen extends StatelessWidget {
  final void Function(Widget) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    // Remove the Scaffold here, just return the content.
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/mak_logo.png",
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // For these example buttons that aren't implemented,
                  // you could either leave them blank or eventually implement them similarly.
                  onNavigate(const PresentationListScreen());
                },
                child: const Text("Presentation Materials"),
              ),
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // Similarly not yet implemented
                  onNavigate(const ScheduleScreen());
                },
                child: const Text("Semester Schedule"),
              ),
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // Instead of Navigator.push, call the callback
                  // to replace the HomeScreen with the ListSurveysScreen widget.
                  onNavigate(const ListSurveysScreen());
                },
                child: const Text("View My Reviews"),
              ),
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // Similarly for the AddSurveyScreen
                  onNavigate(const AddSurveyScreen());
                },
                child: const Text("Add Student Review"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
