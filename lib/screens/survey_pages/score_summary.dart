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
            Text("PC1: ${results["patientCare"]["pc1"]}"),
            Text("PC1 Comment: ${results["patientCare"]["pc1Comments"]}"),
            Text("PC2: ${results["patientCare"]["pc2"]}"),
            Text("PC2 Comment: ${results["patientCare"]["pc2Comments"]}"),
            Text("PC3: ${results["patientCare"]["pc3"]}"),
            Text("PC3 Comment: ${results["patientCare"]["pc3Comments"]}"),
            Text("PC4: ${results["patientCare"]["pc4"]}"),
            Text("PC4 Comment: ${results["patientCare"]["pc4Comments"]}"),
            Text("PC5: ${results["patientCare"]["pc5"]}"),
            Text("PC5 Comment: ${results["patientCare"]["pc5Comments"]}"),
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
