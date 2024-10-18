import "package:flutter/material.dart";

class LevelDescription extends StatelessWidget {
  const LevelDescription({super.key, required this.question});

  final String question;

  @override
  Widget build(BuildContext context) {
    if (question == "pc1") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Does not collect accurate historical data."),
            SizedBox(height: 5),
            Text("Does not use physical exam to confirm information."),
            SizedBox(height: 5),
            Text(
                "Relies exclusively on the documentation of others to generate own database or differential diagnoses."),
            SizedBox(height: 5),
            Text("Fails to recognize patient's central clinical problems."),
            SizedBox(height: 5),
            Text("Fails to recognize potentially life-threatening problems."),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Inconsistently able to acquire accurate historical information in an organized fashion."),
            SizedBox(height: 5),
            Text(
                "Does not perform an appropriately thorough physical exam or misses key physical exam findings."),
            SizedBox(height: 5),
            Text("Does not seek or is overly reliant on secondary data."),
            SizedBox(height: 5),
            Text(
                "Inconsistently recognizes patients’ central clinical problem or develops limited differential diagnoses"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Consistently acquires accurate and relevant histories from patients."),
            SizedBox(height: 5),
            Text("Seeks and obtains data from secondary sources when needed."),
            SizedBox(height: 5),
            Text(
                "Consistently performs accurate and appropriately thorough physical exams."),
            SizedBox(height: 5),
            Text(
                "Uses collected data to define a patient's central clinical problem(s)"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Acquires accurate histories from patients in an efficient, prioritized, and hypothesis/diagnosis driven fashion."),
            SizedBox(height: 5),
            Text(
                "Performs accurate physical exams that are targeted to the patient's complaints."),
            SizedBox(height: 5),
            Text(
                "Synthesizes data to generate a prioritized differential diagnosis and problem list."),
            SizedBox(height: 5),
            Text(
                "Effectively uses history and physical examination skills to minimize the need for further diagnostic testing"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Obtains relevant historical subtleties, including sensitive information that informs the differential diagnosis."),
            SizedBox(height: 5),
            Text("Identifies subtle or unusual physical exam findings."),
            SizedBox(height: 5),
            Text(
                "Efficiently utilizes all sources of secondary data to inform differential diagnosis."),
            SizedBox(height: 5),
            Text(
                "Role models and teaches the effective use of history and physical examination skills to minimize the need for further diagnostic testing"),
          ],
        ),
      );
    } else if (question == "pc2") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Care plans are consistently inappropriate or inaccurate"),
            SizedBox(height: 5),
            Text(
                "Does not react to situations that require urgent or emergent care"),
            SizedBox(height: 5),
            Text("Does not seek additional guidance when needed"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Inconsistently develops an appropriate care plan"),
            SizedBox(height: 5),
            Text("Inconsistently seeks additional guidance when needed"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Consistently develops appropriate care plan"),
            SizedBox(height: 5),
            Text("Recognizes situations requiring urgent or emergent care"),
            SizedBox(height: 5),
            Text(
                "Seeks additional guidance and/or consultation as appropriate"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Appropriately modifies care plans based on patient’s clinical course, additional data, and patient preferences"),
            SizedBox(height: 5),
            Text(
                "Recognizes disease presentations that deviate from common patterns and require complex decision-making"),
            SizedBox(height: 5),
            Text("Manages complex acute and chronic diseases"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Role models and teaches complex and patient-centered care"),
            SizedBox(height: 5),
            Text(
                "Develops customized, prioritized care plans for the most complex patients, incorporating diagnostic uncertainty and cost-effectiveness principles"),
          ],
        ),
      );
    } else if (question == "pc3") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Cannot advance beyond the need for direct supervision in the delivery of patient care"),
            SizedBox(height: 5),
            Text("Cannot manage patients who require urgent or emergent care"),
            SizedBox(height: 5),
            Text(
                "Does not assume responsibility for patient management decisions"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Requires direct supervision to ensure patient safety and quality care"),
            SizedBox(height: 5),
            Text(
                "Inconsistently manages simple ambulatory complaints or common chronic diseases"),
            SizedBox(height: 5),
            Text(
                "Inconsistently provides preventive care in the ambulatory setting"),
            SizedBox(height: 5),
            Text(
                "Inconsistently manages patients with straightforward diagnoses in the inpatient setting"),
            SizedBox(height: 5),
            Text(
                "Unable to manage complex inpatients or patients requiring intensive care"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Requires indirect supervision to ensure patient safety and quality care"),
            SizedBox(height: 5),
            Text(
                "Provides appropriate preventive care and chronic disease management in the ambulatory setting"),
            SizedBox(height: 5),
            Text(
                "Provides comprehensive care for single or multiple diagnoses in the inpatient setting"),
            SizedBox(height: 5),
            Text(
                "Under supervision, provides appropriate care in the intensive care unit"),
            SizedBox(height: 5),
            Text("Initiates management plans for urgent or emergent care"),
            SizedBox(height: 5),
            Text(
                "Cannot independently supervise care provided by junior members of the physician-led team"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Independently manages patients across inpatient and ambulatory clinical settings who have a broad spectrum of clinical disorders including undifferentiated syndromes"),
            SizedBox(height: 5),
            Text(
                "Seeks additional guidance and/or consultation as appropriate"),
            SizedBox(height: 5),
            Text(
                "Appropriately manages situations requiring urgent or emergent care"),
            SizedBox(height: 5),
            Text("Effectively supervises the management decisions of the team"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Manages unusual, rare, or complex disorders"),
          ],
        ),
      );
    } else if (question == "pc4") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Attempts to perform procedures without sufficient technical skill or supervision"),
            SizedBox(height: 5),
            Text(
                "Unwilling to perform procedures when qualified and necessary for patient care"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Possesses insufficient technical skill for safe completion of common procedures"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Possesses basic technical skill for the completion of some common procedures"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Possesses technical skill and has successfully performed all procedures required for certification"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Maximizes patient comfort and safety when performing procedures"),
            SizedBox(height: 5),
            Text(
                "Seeks to independently perform additional procedures (beyond those required for certification) that are anticipated for future practice"),
            SizedBox(height: 5),
            Text(
                "Teaches and supervises the performance of procedures by junior members of the team"),
          ],
        ),
      );
    } else if (question == "pc5") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Is unresponsive to questions or concerns of others when acting as a consultant or utilizing consultant services"),
            SizedBox(height: 5),
            Text(
                "Unwilling to utilize consultant services when appropriate for patient care"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Inconsistently manages patients as a consultant to other physicians/health care teams"),
            SizedBox(height: 5),
            Text(
                "Inconsistently applies risk assessment principles to patients while acting as a consultant"),
            SizedBox(height: 5),
            Text(
                "Inconsistently formulates a clinical question for a consultant to address"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Provides consultation services for patients with clinical problems requiring basic risk assessment"),
            SizedBox(height: 5),
            Text(
                "Asks meaningful clinical questions that guide the input of consultants"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Provides consultation services for patients with basic and complex clinical problems requiring detailed risk assessment"),
            SizedBox(height: 5),
            Text(
                "Appropriately weighs recommendations from consultants in order to effectively manage patient care"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Switches between the role of consultant and primary care doctor with ease"),
            SizedBox(height: 5),
            Text(
                "Provides consultation services for patients with very complex clinical problems requiring extensive risk assessment"),
            SizedBox(height: 5),
            Text(
                "Manages discordant recommendations from multiple consultants"),
          ],
        ),
      );
    } else if (question == "mk1") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "mk2") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "sbp1") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "sbl2") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "sbp3") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "sbp4") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "pbli1") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "pbli2") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "pbli3") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "pbli4") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "prof1") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "prof2") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "prof3") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "prof4") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "ics1") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "ics2") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else if (question == "ics3") {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Critical Deficiencies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Early Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Advanced Learner",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Ready for Unsupervised Practice",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "Aspirational",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
    } else {
      return const Text(
        "No description available",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    }
  }
}
