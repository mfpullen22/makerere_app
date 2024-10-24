import "package:flutter/material.dart";
import "package:makerere_app/widgets/view_survey.dart";

class ViewSurveysScreen extends StatelessWidget {
  const ViewSurveysScreen(
      {super.key, required this.results, required this.role});

  final Map<String, dynamic> results;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Review Details",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ViewSurvey(results: results, role: role),
        ));
  }
}
