import "package:flutter/material.dart";
import "package:makerere_app/screens/add_survey.dart";
import "package:makerere_app/screens/list_surveys.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                onPressed: () {},
                child: const Text("Orientation Materials"),
              ),
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Semester Schedule"),
              ),
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListSurveysScreen(),
                    ),
                  );
                },
                child: const Text("View My Reviews"),
              ),
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddSurveyScreen(),
                    ),
                  );
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
