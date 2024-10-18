import "package:flutter/material.dart";
import "package:makerere_app/widgets/level_description.dart";
import "package:makerere_app/widgets/score_interpretation.dart";

class MedicalKnowledgeReview extends StatefulWidget {
  const MedicalKnowledgeReview(
      {super.key, required this.onBack, required this.onContinue});

  final Function onBack;
  final Function onContinue;

  @override
  State<MedicalKnowledgeReview> createState() => _MedicalKnowledgeReviewState();
}

class _MedicalKnowledgeReviewState extends State<MedicalKnowledgeReview> {
  double sliderValue1 = 1;
  double sliderValue2 = 1;

  TextEditingController medicalKnowledgeComments1Controller =
      TextEditingController();
  TextEditingController medicalKnowledgeComments2Controller =
      TextEditingController();

  Widget scoreInterp = const Text("Select a score");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "Medical Knowledge",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "1. Clinical Knowdledge",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Slider(
                value: sliderValue1,
                min: 1,
                max: 9,
                divisions: 8,
                label: sliderValue1.toString(),
                onChanged: (value) {
                  setState(() {
                    sliderValue1 = value;
                  });
                },
              ),
              Center(
                child: ScoreInterpretationText(score: sliderValue1),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Show a dialog with the level description
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Center(
                            child: Text(
                              'Skill Levels',
                              style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          content: const LevelDescription(
                              question:
                                  'mk1'), // Pass the appropriate question ID here
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Tap for description of skill levels for this question.",
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text("List things the SHO should do to improve:"),
              TextField(
                controller:
                    medicalKnowledgeComments1Controller, // Attach the controller
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your comments here",
                ),
                maxLines: 4, // Allow multiple lines of text
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "2. Knowledge of diagnostic testing and procedures",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Slider(
                value: sliderValue2,
                min: 1,
                max: 9,
                divisions: 8,
                label: sliderValue2.toString(),
                onChanged: (value) {
                  setState(() {
                    sliderValue2 = value;
                  });
                },
              ),
              Center(
                child: ScoreInterpretationText(score: sliderValue2),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Show a dialog with the level description
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Center(
                            child: Text(
                              'Skill Levels',
                              style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          content: const LevelDescription(
                              question:
                                  'mk2'), // Pass the appropriate question ID here
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Tap for description of skill levels for this question.",
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text("List things the SHO should do to improve:"),
              TextField(
                controller:
                    medicalKnowledgeComments2Controller, // Attach the controller
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your comments here",
                ),
                maxLines: 4, // Allow multiple lines of text
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          widget.onBack({
                            "mk1": sliderValue1,
                            "mk2": sliderValue2,
                            "mk1Comments":
                                medicalKnowledgeComments1Controller.text,
                            "mk2Comments":
                                medicalKnowledgeComments2Controller.text,
                          });
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            Text("Back", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          widget.onContinue({
                            "mk1": sliderValue1,
                            "mk2": sliderValue2,
                            "mk1Comments":
                                medicalKnowledgeComments1Controller.text,
                            "mk2Comments":
                                medicalKnowledgeComments2Controller.text,
                          });
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Continue",
                                style: TextStyle(color: Colors.white)),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
