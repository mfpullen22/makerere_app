import "package:flutter/material.dart";

class ScoreSummary extends StatelessWidget {
  const ScoreSummary({super.key, required this.results});

  final Map<String, dynamic> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Please review your scores and comments below. Navigate back to make changes.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  "Patient Care 1: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  results["patientCare"]["pc1"].toInt().toString(),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  "Patient Care 1 Comment: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(results["patientCare"]["pc1Comments"])
              ],
            ),
            Row(
              children: [
                const Text(
                  "Patient Care 2: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(results["patientCare"]["pc2"].toInt().toString()),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Patient Care 2 Comment: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(results["patientCare"]["pc2Comments"]),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Patient Care 3: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(results["patientCare"]["pc3"].toInt().toString()),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Patient Care 3 Comment: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(results["patientCare"]["pc3Comments"]),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Patient Care 4: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(results["patientCare"]["pc4"].toInt().toString()),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Patient Care 4 Comment: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(results["patientCare"]["pc4Comments"]),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Patient Care 5: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(results["patientCare"]["pc5"].toInt().toString()),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Patient Care 5 Comment: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(results["patientCare"]["pc5Comments"]),
              ],
            ),
            TextButton(
                onPressed: () {
                  print(results);
                },
                child: const Text("TEST PRINT"))
          ],
        ),
      ),
    );
  }
}
