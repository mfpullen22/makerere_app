import "package:flutter/material.dart";

class PatientCareReview extends StatefulWidget {
  final Function onBack;
  final Function onContinue;
  const PatientCareReview(
      {super.key, required this.onBack, required this.onContinue});

  @override
  State<PatientCareReview> createState() => _PatientCareReviewState();
}

class _PatientCareReviewState extends State<PatientCareReview> {
  double sliderValue1 = 1;
  Widget scoreInterp = const Text("Select a score");

  Widget scoreInterpText(score) {
    if (score == 1) {
      return scoreInterp = const Text(
        "Critical Deficiencies",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 2) {
      return scoreInterp = const Text(
        "SHO demonstrates all qualities of 'Critical Deficiencies' and some of 'Early Learner'.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 3) {
      return scoreInterp = const Text(
        "Early Learner",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 4) {
      return scoreInterp = const Text(
        "SHO demonstrates all qualities of 'Early Learner' and some of 'Advanced Learner'.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 5) {
      return scoreInterp = const Text(
        "Advanced Learner",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 6) {
      return scoreInterp = const Text(
        "SHO demonstrates all qualities of 'Advanced Learner' and some of 'Ready for Unsupervised Practice'.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 7) {
      return scoreInterp = const Text(
        "Ready for Unsupervised Practice",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 8) {
      return scoreInterp = const Text(
        "SHO demonstrates all qualities of 'Ready for Unsupervised Practice' and some of 'Aspirational'.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 9) {
      return scoreInterp = const Text(
        "Aspirational",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else {
      return scoreInterp = const Text(
        "Select a score",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
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
          const Text(
              "1. Gathers and synthesizes essential and accurate information to define each patient’s clinical problem(s)"),
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
          scoreInterpText(sliderValue1),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.red),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      widget.onBack();
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
                      widget.onContinue();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Continue", style: TextStyle(color: Colors.white)),
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
    );
  }
}
