import "package:flutter/material.dart";

class ViewSurvey extends StatelessWidget {
  const ViewSurvey({super.key, required this.results, required this.role});

  final Map<String, dynamic> results;
  final String role;

  @override
  Widget build(BuildContext context) {
    final totalScore =
        results["patientCare"]["pcTotal"] +
        results["medicalKnowledge"]["mkTotal"] +
        results["systemsBasedPractice"]["sbpTotal"] +
        results["practiceBasedLearning"]["pblTotal"] +
        results["professionalism"]["profTotal"] +
        results["interpersonal"]["icsTotal"];

    return SingleChildScrollView(
      child: Column(
        children: [
          if (role == "faculty")
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Please review your scores and comments below. Navigate back to make changes.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          if (role == "faculty") const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Total Score: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text("${totalScore.toString()} / 198"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Patient Care",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "PC1: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(results["patientCare"]["pc1"].toInt().toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "PC1 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["patientCare"]["pc1Comments"] == "")
                      const Text("None")
                    else
                      Text(results["patientCare"]["pc1Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "PC2: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(results["patientCare"]["pc2"].toInt().toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "PC2 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["patientCare"]["pc2Comments"] == "")
                      const Text("None")
                    else
                      Text(results["patientCare"]["pc2Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "PC3: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(results["patientCare"]["pc3"].toInt().toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "PC3 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["patientCare"]["pc3Comments"] == "")
                      const Text("None")
                    else
                      Text(results["patientCare"]["pc3Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "PC4: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(results["patientCare"]["pc4"].toInt().toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "PC4 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["patientCare"]["pc4Comments"] == "")
                      const Text("None")
                    else
                      Text(results["patientCare"]["pc4Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "PC5: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(results["patientCare"]["pc5"].toInt().toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "PC5 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["patientCare"]["pc5Comments"] == "")
                      const Text("None")
                    else
                      Text(results["patientCare"]["pc5Comments"]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Medical Knowledge",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "MK1: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(results["medicalKnowledge"]["mk1"].toInt().toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "MK1 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["medicalKnowledge"]["mk1Comments"] == "")
                      const Text("None")
                    else
                      Text(results["medicalKnowledge"]["mk1Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "MK2: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(results["medicalKnowledge"]["mk2"].toInt().toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "MK2 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["medicalKnowledge"]["mk2Comments"] == "")
                      const Text("None")
                    else
                      Text(results["medicalKnowledge"]["mk2Comments"]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lime, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Systems Based Practice",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "SBP1: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["systemsBasedPractice"]["sbp1"]
                          .toInt()
                          .toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "SBP1 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["systemsBasedPractice"]["sbp1Comments"] == "")
                      const Text("None")
                    else
                      Text(results["systemsBasedPractice"]["sbp1Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "SBP2: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["systemsBasedPractice"]["sbp2"]
                          .toInt()
                          .toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "SBP2 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["systemsBasedPractice"]["sbp2Comments"] == "")
                      const Text("None")
                    else
                      Text(results["systemsBasedPractice"]["sbp2Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "SBP3: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["systemsBasedPractice"]["sbp3"]
                          .toInt()
                          .toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "SBP3 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["systemsBasedPractice"]["sbp3Comments"] == "")
                      const Text("None")
                    else
                      Text(results["systemsBasedPractice"]["sbp3Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "SBP4: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["systemsBasedPractice"]["sbp4"]
                          .toInt()
                          .toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "SBP4 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["systemsBasedPractice"]["sbp4Comments"] == "")
                      const Text("None")
                    else
                      Text(results["systemsBasedPractice"]["sbp4Comments"]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Practice Based Learning",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "PBL1: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["practiceBasedLearning"]["pbl1"]
                          .toInt()
                          .toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "PBL1 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["practiceBasedLearning"]["pbl1Comments"] == "")
                      const Text("None")
                    else
                      Text(results["practiceBasedLearning"]["pbl1Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "PBL2: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["practiceBasedLearning"]["pbl2"]
                          .toInt()
                          .toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "PBL2 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["practiceBasedLearning"]["pbl2Comments"] == "")
                      const Text("None")
                    else
                      Text(results["practiceBasedLearning"]["pbl2Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "PBL3: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["practiceBasedLearning"]["pbl3"]
                          .toInt()
                          .toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "PBL3 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["practiceBasedLearning"]["pbl3Comments"] == "")
                      const Text("None")
                    else
                      Text(results["practiceBasedLearning"]["pbl3Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "PBL4: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["practiceBasedLearning"]["pbl4"]
                          .toInt()
                          .toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "PBL4 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["practiceBasedLearning"]["pbl4Comments"] == "")
                      const Text("None")
                    else
                      Text(results["practiceBasedLearning"]["pbl4Comments"]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Professionalism",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Prof1: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["professionalism"]["prof1"].toInt().toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Prof1 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["professionalism"]["prof1Comments"] == "")
                      const Text("None")
                    else
                      Text(results["professionalism"]["prof1Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "Prof2: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["professionalism"]["prof2"].toInt().toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Prof2 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["professionalism"]["prof2Comments"] == "")
                      const Text("None")
                    else
                      Text(results["professionalism"]["prof2Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "Prof3: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["professionalism"]["prof3"].toInt().toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Prof3 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["professionalism"]["prof3Comments"] == "")
                      const Text("None")
                    else
                      Text(results["professionalism"]["prof3Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "Prof4: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      results["professionalism"]["prof4"].toInt().toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Prof4 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["professionalism"]["prof4Comments"] == "")
                      const Text("None")
                    else
                      Text(results["professionalism"]["prof4Comments"]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Interpersonal and Communication Skills",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "ICS1: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(results["interpersonal"]["ics1"].toInt().toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "ICS1 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["interpersonal"]["ics1Comments"] == "")
                      const Text("None")
                    else
                      Text(results["interpersonal"]["ics1Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "ICS2: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(results["interpersonal"]["ics2"].toInt().toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "ICS2 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["interpersonal"]["ics2Comments"] == "")
                      const Text("None")
                    else
                      Text(results["interpersonal"]["ics2Comments"]),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text(
                      "ICS3: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(results["interpersonal"]["ics3"].toInt().toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "ICS3 Recommendations: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (results["interpersonal"]["ics3Comments"] == "")
                      const Text("None")
                    else
                      Text(results["interpersonal"]["ics3Comments"]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
