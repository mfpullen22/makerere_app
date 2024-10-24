import "package:flutter/material.dart";
import "package:makerere_app/widgets/level_description.dart";
import "package:makerere_app/widgets/score_interpretation.dart";

class PatientCareReview extends StatefulWidget {
  const PatientCareReview(
      {super.key, required this.onBack, required this.onContinue});

  final Function onBack;
  final Function onContinue;

  @override
  State<PatientCareReview> createState() => _PatientCareReviewState();
}

class _PatientCareReviewState extends State<PatientCareReview> {
  double sliderValue1 = 1;
  double sliderValue2 = 1;
  double sliderValue3 = 1;
  double sliderValue4 = 1;
  double sliderValue5 = 1;
  double total = 0;
  TextEditingController patientCareComments1Controller =
      TextEditingController();
  TextEditingController patientCareComments2Controller =
      TextEditingController();
  TextEditingController patientCareComments3Controller =
      TextEditingController();
  TextEditingController patientCareComments4Controller =
      TextEditingController();
  TextEditingController patientCareComments5Controller =
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
              TextButton(
                onPressed: () {
                  setState(() {
                    sliderValue1 = 1;
                    sliderValue2 = 2;
                    sliderValue3 = 3;
                    sliderValue4 = 4;
                    sliderValue5 = 5;
                  });
                  widget.onContinue({
                    "pc1": sliderValue1,
                    "pc2": sliderValue2,
                    "pc3": sliderValue3,
                    "pc4": sliderValue4,
                    "pc5": sliderValue5,
                    "pcTotal": sliderValue1 +
                        sliderValue2 +
                        sliderValue3 +
                        sliderValue4 +
                        sliderValue5,
                    "pc1Comments": "PCTest1",
                    "pc2Comments": "PCTest2",
                    "pc3Comments": "PCTest3",
                    "pc4Comments": "PCTest4",
                    "pc5Comments": "PCTest5",
                  });
                },
                child: const Text("TEST"),
              ),
              const Center(
                child: Text(
                  "Patient Care Skills",
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
                  "1. Gathers and synthesizes essential and accurate information to define each patient’s clinical problem(s)",
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
                                  'pc1'), // Pass the appropriate question ID here
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
                    patientCareComments1Controller, // Attach the controller
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
                  "2. Develops and achieves a comprehensive management plans each patient.",
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
                                  'pc2'), // Pass the appropriate question ID here
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
                    patientCareComments2Controller, // Attach the controller
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
                  "3. Manages patients with progressive responsibility and independence.",
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
                                  'pc3'), // Pass the appropriate question ID here
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
                    patientCareComments3Controller, // Attach the controller
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
                  "4. Skill in performing procedures.",
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
                                  'pc4'), // Pass the appropriate question ID here
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
                    patientCareComments4Controller, // Attach the controller
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
                  "5. Requests and provides consultative care.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Slider(
                value: sliderValue5,
                min: 1,
                max: 9,
                divisions: 8,
                label: sliderValue5.toString(),
                onChanged: (value) {
                  setState(() {
                    sliderValue5 = value;
                  });
                },
              ),
              Center(
                child: ScoreInterpretationText(score: sliderValue5),
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
                                  'pc5'), // Pass the appropriate question ID here
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
                    patientCareComments5Controller, // Attach the controller
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
                            "pc1": sliderValue1,
                            "pc2": sliderValue2,
                            "pc3": sliderValue3,
                            "pc4": sliderValue4,
                            "pc5": sliderValue5,
                            "pcTotal": sliderValue1 +
                                sliderValue2 +
                                sliderValue3 +
                                sliderValue4 +
                                sliderValue5,
                            "pc1Comments": patientCareComments1Controller.text,
                            "pc2Comments": patientCareComments2Controller.text,
                            "pc3Comments": patientCareComments3Controller.text,
                            "pc4Comments": patientCareComments4Controller.text,
                            "pc5Comments": patientCareComments5Controller.text,
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
                            "pc1": sliderValue1,
                            "pc2": sliderValue2,
                            "pc3": sliderValue3,
                            "pc4": sliderValue4,
                            "pc5": sliderValue5,
                            "pcTotal": sliderValue1 +
                                sliderValue2 +
                                sliderValue3 +
                                sliderValue4 +
                                sliderValue5,
                            "pc1Comments": patientCareComments1Controller.text,
                            "pc2Comments": patientCareComments2Controller.text,
                            "pc3Comments": patientCareComments3Controller.text,
                            "pc4Comments": patientCareComments4Controller.text,
                            "pc5Comments": patientCareComments5Controller.text,
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
