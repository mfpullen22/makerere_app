import "package:flutter/material.dart";
import "package:makerere_app/screens/add_survey.dart";
import "package:makerere_app/screens/admin_tasks_screen.dart";
import "package:makerere_app/screens/list_surveys.dart";
import "package:makerere_app/screens/mentorship.dart";
import "package:makerere_app/screens/presentation_list.dart";
import "package:makerere_app/screens/schedule.dart";
import 'package:url_launcher/url_launcher.dart';

void _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

Widget _buildSquareButton(
  BuildContext context,
  String label,
  double size,
  VoidCallback onPressed,
) {
  return SizedBox(
    width: size,
    height: size,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 3,
        backgroundColor: const Color.fromARGB(255, 230, 237, 240),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(21, 40, 77, 1),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  final void Function(Widget) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final double buttonSize = MediaQuery.of(context).size.width / 2.75;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              "assets/images/anniversary_logo.png",
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
            const SizedBox(height: 16),

            // Button grid
            Center(
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildSquareButton(
                      context, "Presentation\nMaterials", buttonSize, () {
                    onNavigate(const PresentationListScreen());
                  }),
                  _buildSquareButton(context, "View\nMy Reviews", buttonSize,
                      () {
                    onNavigate(const ListSurveysScreen());
                  }),
                  _buildSquareButton(context, "Add Student\nReview", buttonSize,
                      () {
                    onNavigate(const AddSurveyScreen());
                  }),
                  _buildSquareButton(
                      context, "Add Mentorship\nMeeting", buttonSize, () {
                    onNavigate(const MeetingFormScreen());
                  }),
                  _buildSquareButton(context, "Admin\nTasks", buttonSize, () {
                    onNavigate(const AdminTasksScreen());
                  }),
                  _buildSquareButton(context, "Open\nEvidence", buttonSize, () {
                    _launchURL("https://www.openevidence.com/");
                  }),
                ],
              ),
            ),

            const SizedBox(height: 32), // buffer for bottom nav bar
          ],
        ),
      ),
    );
  }
}
