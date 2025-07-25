import "package:flutter/material.dart";

class ReviewInstructions extends StatelessWidget {
  final Function onContinue;
  const ReviewInstructions({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Center(
            child: Text(
              "Instructions for Review",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
              "The internal medicine milestones are arranged in progressive stages of competence that do not correspond with post-graduate year of education."),
          const SizedBox(height: 10),
          const Text(
              "For each prompt, please select a score that corresponds with one of the stage most fitting for the SHO's performance."),
          const SizedBox(height: 10),
          const Text(
              "The stages are described below. Note that chosing a value between two stages indicates that the SHO demonstrated all skills of the lower stage and some skills of the higher stage. For example, a score of '6' would means the SHO demonstrated all skills of 'Advanced Learner' (a score of 5) and some skills of 'Ready for Unsupervised Practice' (a score of 7)."),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Score 1: Critical Deficiencies",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Score 3: Early Learner",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Score 5: Advanced Learner",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Score 7: Ready for Unsupervised Practice",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Score 9: Aspirational",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      onContinue();
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
