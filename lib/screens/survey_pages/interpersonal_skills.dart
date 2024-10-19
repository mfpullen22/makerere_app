import "package:flutter/material.dart";
import "package:makerere_app/widgets/level_description.dart";
import "package:makerere_app/widgets/score_interpretation.dart";

class InterpersonalCommunicationSkills extends StatefulWidget {
  const InterpersonalCommunicationSkills(
      {super.key, required this.onBack, required this.onContinue});

  final Function onBack;
  final Function onContinue;

  @override
  State<InterpersonalCommunicationSkills> createState() =>
      _InterpersonalCommunicationSkillsState();
}

class _InterpersonalCommunicationSkillsState
    extends State<InterpersonalCommunicationSkills> {
  double sliderValue1 = 1;
  double sliderValue2 = 1;
  double sliderValue3 = 1;

  TextEditingController icsComments1Controller = TextEditingController();
  TextEditingController icsComments2Controller = TextEditingController();
  TextEditingController icsComments3Controller = TextEditingController();

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
                  "Interpersonal and Communication Skills",
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
                  "1. Communicates effectively with patients and caregivers.",
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
                                  'ics1'), // Pass the appropriate question ID here
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
                controller: icsComments1Controller, // Attach the controller
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
                  "2. Communicates effectively in interprofessional teams.",
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
                                  'ics2'), // Pass the appropriate question ID here
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
                controller: icsComments2Controller, // Attach the controller
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
                  "3. Appropriate utilization and completion of health records.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Slider(
                value: sliderValue3,
                min: 1,
                max: 9,
                divisions: 8,
                label: sliderValue3.toString(),
                onChanged: (value) {
                  setState(() {
                    sliderValue3 = value;
                  });
                },
              ),
              Center(
                child: ScoreInterpretationText(score: sliderValue3),
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
                                  'ics3'), // Pass the appropriate question ID here
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
                controller: icsComments3Controller, // Attach the controller
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
                            "ics1": sliderValue1,
                            "ics2": sliderValue2,
                            "ics3": sliderValue3,
                            "ics1Comments": icsComments1Controller.text,
                            "ics2Comments": icsComments2Controller.text,
                            "ics3Comments": icsComments3Controller.text,
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
                            "ics1": sliderValue1,
                            "ics2": sliderValue2,
                            "ics3": sliderValue3,
                            "ics1Comments": icsComments1Controller.text,
                            "ics2Comments": icsComments2Controller.text,
                            "ics3Comments": icsComments3Controller.text,
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
