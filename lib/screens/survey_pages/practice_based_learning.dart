import "package:flutter/material.dart";
import "package:makerere_app/widgets/level_description.dart";
import "package:makerere_app/widgets/score_interpretation.dart";

class PracticeBasedLearning extends StatefulWidget {
  const PracticeBasedLearning({
    super.key,
    required this.onBack,
    required this.onContinue,
  });

  final Function onBack;
  final Function onContinue;

  @override
  State<PracticeBasedLearning> createState() => _PracticeBasedLearningState();
}

class _PracticeBasedLearningState extends State<PracticeBasedLearning> {
  double sliderValue1 = 1;
  double sliderValue2 = 1;
  double sliderValue3 = 1;
  double sliderValue4 = 1;

  TextEditingController pblComments1Controller = TextEditingController();
  TextEditingController pblComments2Controller = TextEditingController();
  TextEditingController pblComments3Controller = TextEditingController();
  TextEditingController pblComments4Controller = TextEditingController();

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
              TextButton(
                onPressed: () {
                  setState(() {
                    sliderValue1 = 1;
                    sliderValue2 = 2;
                    sliderValue3 = 3;
                    sliderValue4 = 4;
                  });
                  widget.onContinue({
                    "pbl1": sliderValue1,
                    "pbl2": sliderValue2,
                    "pbl3": sliderValue3,
                    "pbl4": sliderValue4,
                    "pblTotal": sliderValue1 +
                        sliderValue2 +
                        sliderValue3 +
                        sliderValue4,
                    "pbl1Comments": "PBLTest1",
                    "pbl2Comments": "PBLTest2",
                    "pbl3Comments": "PBLTest3",
                    "pbl4Comments": "PBLTest4",
                  });
                },
                child: const Text("TEST"),
              ),
              const Center(
                child: Text(
                  "Practice-Based Learning and Improvement",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "1. Monitors practice with goal for improvement.",
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
              Center(child: ScoreInterpretationText(score: sliderValue1)),
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
                            question: 'pbl1',
                          ), // Pass the appropriate question ID here
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
                controller: pblComments1Controller, // Attach the controller
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
                  "2. Learns and improves via performance audit.",
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
              Center(child: ScoreInterpretationText(score: sliderValue2)),
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
                            question: 'pbl2',
                          ), // Pass the appropriate question ID here
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
                controller: pblComments2Controller, // Attach the controller
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your comments here",
                ),
                maxLines: 4, // Allow multiple lines of text
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "3. Learns and improves via feedback.",
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
              Center(child: ScoreInterpretationText(score: sliderValue3)),
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
                            question: 'pbl3',
                          ), // Pass the appropriate question ID here
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
                controller: pblComments3Controller, // Attach the controller
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
                  "4. Learns and improves at the point of care.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Slider(
                value: sliderValue4,
                min: 1,
                max: 9,
                divisions: 8,
                label: sliderValue4.toString(),
                onChanged: (value) {
                  setState(() {
                    sliderValue4 = value;
                  });
                },
              ),
              Center(child: ScoreInterpretationText(score: sliderValue4)),
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
                            question: 'pbl4',
                          ), // Pass the appropriate question ID here
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
                controller: pblComments4Controller, // Attach the controller
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
                      color: Colors.red,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          widget.onBack({
                            "pbl1": sliderValue1,
                            "pbl2": sliderValue2,
                            "pbl3": sliderValue3,
                            "pbl4": sliderValue4,
                            "pblTotal": sliderValue1 +
                                sliderValue2 +
                                sliderValue3 +
                                sliderValue4,
                            "pbl1Comments": pblComments1Controller.text,
                            "pbl2Comments": pblComments2Controller.text,
                            "pbl3Comments": pblComments3Controller.text,
                            "pbl4Comments": pblComments4Controller.text,
                          });
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_back, color: Colors.white),
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
                      color: Colors.green,
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          widget.onContinue({
                            "pbl1": sliderValue1,
                            "pbl2": sliderValue2,
                            "pbl3": sliderValue3,
                            "pbl4": sliderValue4,
                            "pblTotal": sliderValue1 +
                                sliderValue2 +
                                sliderValue3 +
                                sliderValue4,
                            "pbl1Comments": pblComments1Controller.text,
                            "pbl2Comments": pblComments2Controller.text,
                            "pbl3Comments": pblComments3Controller.text,
                            "pbl4Comments": pblComments4Controller.text,
                          });
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Continue",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
