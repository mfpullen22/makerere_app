import "package:flutter/material.dart";

class ScoreInterpretationText extends StatelessWidget {
  const ScoreInterpretationText({super.key, required this.score});
  final double score;

  @override
  Widget build(BuildContext context) {
    if (score == 1) {
      return const Text(
        "Critical Deficiencies",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 2) {
      return const Text(
        "SHO demonstrates all qualities of 'Critical Deficiencies' and some of 'Early Learner'.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 3) {
      return const Text(
        "Early Learner",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 4) {
      return const Text(
        "SHO demonstrates all qualities of 'Early Learner' and some of 'Advanced Learner'.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 5) {
      return const Text(
        "Advanced Learner",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 6) {
      return const Text(
        "SHO demonstrates all qualities of 'Advanced Learner' and some of 'Ready for Unsupervised Practice'.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 7) {
      return const Text(
        "Ready for Unsupervised Practice",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 8) {
      return const Text(
        "SHO demonstrates all qualities of 'Ready for Unsupervised Practice' and some of 'Aspirational'.",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else if (score == 9) {
      return const Text(
        "Aspirational",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    } else {
      return const Text(
        "Select a score",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    }
  }
}
