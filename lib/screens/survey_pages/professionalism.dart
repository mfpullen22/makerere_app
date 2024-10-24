import "package:flutter/material.dart";
import "package:makerere_app/widgets/level_description.dart";
import "package:makerere_app/widgets/score_interpretation.dart";

class Professionalism extends StatefulWidget {
  const Professionalism(
      {super.key, required this.onBack, required this.onContinue});

  final Function onBack;
  final Function onContinue;

  @override
  State<Professionalism> createState() => _ProfessionalismState();
}

class _ProfessionalismState extends State<Professionalism> {
  double sliderValue1 = 1;
  double sliderValue2 = 1;
  double sliderValue3 = 1;
  double sliderValue4 = 1;

  TextEditingController profComments1Controller = TextEditingController();
  TextEditingController profComments2Controller = TextEditingController();
  TextEditingController profComments3Controller = TextEditingController();
  TextEditingController profComments4Controller = TextEditingController();

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
                    "prof1": sliderValue1,
                    "prof2": sliderValue2,
                    "prof3": sliderValue3,
                    "prof4": sliderValue4,
                    "profTotal": sliderValue1 +
                        sliderValue2 +
                        sliderValue3 +
                        sliderValue4,
                    "prof1Comments": "ProfTest1",
                    "prof2Comments": "ProfTest2",
                    "prof3Comments": "ProfTest3",
                    "prof4Comments": "ProfTest4",
                  });
                },
                child: const Text("TEST"),
              ),
              const Center(
                child: Text(
                  "Professionalism",
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
                  "1. Has professional and respectful interactions with patients, caregivers, and members of the interprofessional team.",
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
                                  'prof1'), // Pass the appropriate question ID here
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
                controller: profComments1Controller, // Attach the controller
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
                  "2. Accepts responsibility and follows through on tasks.",
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
                                  'prof2'), // Pass the appropriate question ID here
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
                controller: profComments2Controller, // Attach the controller
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
                  "3. Response to each patient's unique characteristics and needs.",
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
                                  'prof3'), // Pass the appropriate question ID here
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
                controller: profComments3Controller, // Attach the controller
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
                  "4. Exhibits integrity and ethical behavior in professional conduct.",
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
              Center(
                child: ScoreInterpretationText(score: sliderValue4),
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
                                  'prof4'), // Pass the appropriate question ID here
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
                controller: profComments4Controller, // Attach the controller
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
                            "prof1": sliderValue1,
                            "prof2": sliderValue2,
                            "prof3": sliderValue3,
                            "prof4": sliderValue4,
                            "profTotal": sliderValue1 +
                                sliderValue2 +
                                sliderValue3 +
                                sliderValue4,
                            "prof1Comments": profComments1Controller.text,
                            "prof2Comments": profComments2Controller.text,
                            "prof3Comments": profComments3Controller.text,
                            "prof4Comments": profComments4Controller.text,
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
                            "prof1": sliderValue1,
                            "prof2": sliderValue2,
                            "prof3": sliderValue3,
                            "prof4": sliderValue4,
                            "profTotal": sliderValue1 +
                                sliderValue2 +
                                sliderValue3 +
                                sliderValue4,
                            "prof1Comments": profComments1Controller.text,
                            "prof2Comments": profComments2Controller.text,
                            "prof3Comments": profComments3Controller.text,
                            "prof4Comments": profComments4Controller.text,
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
