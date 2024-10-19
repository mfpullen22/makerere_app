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
                "Lacks the scientific, socioeconomic or behavioral knowledge required to provide patient care"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Possesses insufficient scientific, socioeconomic and behavioral knowledge required to provide care for common medical conditions and basic preventive care"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Possesses the scientific, socioeconomic and behavioral knowledge required to provide care for common medical conditions and basic preventive care"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Possesses the scientific, socioeconomic and behavioral knowledge required to provide care for complex medical conditions and comprehensive preventive care"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Possesses the scientific, socioeconomic and behavioral knowledge required to successfully diagnose and treat medically uncommon, ambiguous and complex conditions"),
          ],
        ),
      );
    } else if (question == "mk2") {
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
                "Lacks foundational knowledge to apply diagnostic testing and procedures to patient care"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Inconsistently interprets basic diagnostic tests accurately"),
            SizedBox(height: 5),
            Text(
                "Does not understand the concepts of pre-test probability and test performance characteristics"),
            SizedBox(height: 5),
            Text(
                "Minimally understands the rationale and risks associated with common procedures"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Consistently interprets basic diagnostic tests accurately"),
            SizedBox(height: 5),
            Text(
                "Needs assistance to understand the concepts of pre-test probability and test performance characteristics"),
            SizedBox(height: 5),
            Text(
                "Fully understands the rationale and risks associated with common procedures"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Interprets complex diagnostic tests accurately"),
            SizedBox(height: 5),
            Text(
                "Understands the concepts of pre-test probability and test performance characteristics"),
            SizedBox(height: 5),
            Text(
                "Teaches the rationale and risks associated with common procedures and anticipates potential complications when performing procedures"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Anticipates and accounts for pitfalls and biases when interpreting diagnostic tests and procedures"),
            SizedBox(height: 5),
            Text(
                "Pursues knowledge of new and emerging diagnostic tests and procedures"),
          ],
        ),
      );
    } else if (question == "sbp1") {
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
                "Refuses to recognize the contributions of other interprofessional team members"),
            SizedBox(height: 5),
            Text("Frustrates team members with inefficiency and errors"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Identifies roles of other team members but does not recognize how/when to utilize them as resources"),
            SizedBox(height: 5),
            Text(
                "Frequently requires reminders from team to complete physician responsibilities (e.g. talk to family, enter orders)"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Understands the roles and responsibilities of all team members but uses them ineffectively"),
            SizedBox(height: 5),
            Text(
                "Participates in team discussions when required but does not actively seek input from other team members"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Understands the roles and responsibilities of and effectively partners with, all members of the team"),
            SizedBox(height: 5),
            Text(
                "Actively engages in team meetings and collaborative decision-making"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Integrates all members of the team into the care of patients, such that each is able to maximize their skills in the care of the patient"),
            SizedBox(height: 5),
            Text(
                "Efficiently coordinates activities of other team members to optimize care"),
            SizedBox(height: 5),
            Text(
                "Viewed by other team members as a leader in the delivery of high quality care"),
          ],
        ),
      );
    } else if (question == "sbp2") {
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
                "Ignores a risk for error within the system that may impact the care of a patient"),
            SizedBox(height: 5),
            Text(
                "Ignores feedback and is unwilling to change behavior in order to reduce the risk for error"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Does not recognize the potential for system error"),
            SizedBox(height: 5),
            Text(
                "Makes decisions that could lead to error which are otherwise corrected by the system or supervision"),
            SizedBox(height: 5),
            Text(
                "Resistant to feedback about decisions that may lead to error or otherwise cause harm"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Recognizes the potential for error within the system"),
            SizedBox(height: 5),
            Text(
                "Identifies obvious or critical causes of error and notifies supervisor accordingly"),
            SizedBox(height: 5),
            Text(
                "Recognizes the potential risk for error in the immediate system and takes necessary steps to mitigate that risk"),
            SizedBox(height: 5),
            Text(
                "Willing to receive feedback about decisions that may lead to error or otherwise cause harm"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Identifies systemic causes of medical error and navigates them to provide safe patient care"),
            SizedBox(height: 5),
            Text(
                "Advocates for safe patient care and optimal patient care systems"),
            SizedBox(height: 5),
            Text(
                "Activates formal system resources to investigate and mitigate real or potential medical error"),
            SizedBox(height: 5),
            Text(
                "Reflects upon and learns from own critical incidents that may lead to medical error"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Advocates for system leadership to formally engage in quality assurance and quality improvement activities"),
            SizedBox(height: 5),
            Text(
                "Viewed as a leader in identifying and advocating for the prevention of medical error"),
            SizedBox(height: 5),
            Text(
                "Teaches others regarding the importance of recognizing and mitigating system error"),
          ],
        ),
      );
    } else if (question == "sbp3") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Ignores cost issues in the provision of care"),
            SizedBox(height: 5),
            Text(
                "Demonstrates no effort to overcome barriers to cost-effective care"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Lacks awareness of external factors (e.g. socio-economic, cultural, literacy, insurance status) that impact the cost of health care and the role that external stakeholders (e.g. providers, suppliers, financers, purchasers) have on the cost of care"),
            SizedBox(height: 5),
            Text(
                "Does not consider limited health care resources when ordering diagnostic or therapeutic interventions"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Recognizes that external factors influence a patient’s utilization of health care and may act as barriers to cost-effective care"),
            SizedBox(height: 5),
            Text("Minimizes unnecessary diagnostic and therapeutic tests"),
            SizedBox(height: 5),
            Text(
                "Possesses an incomplete understanding of cost-awareness principles for a population of patients (e.g. screening tests)"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Consistently works to address patient-specific barriers to cost-effective care"),
            SizedBox(height: 5),
            Text(
                "Advocates for cost-conscious utilization of resources (i.e. emergency department visits, hospital readmissions)"),
            SizedBox(height: 5),
            Text(
                "Incorporates cost-awareness principles into standard clinical judgments and decision-making, including screening tests"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Teaches patients and healthcare team members to recognize and address common barriers to cost-effective care and appropriate utilization of resources"),
            SizedBox(height: 5),
            Text(
                "Actively participates in initiatives and care delivery models designed to overcome or mitigate barriers to cost-effective high-quality care"),
          ],
        ),
      );
    } else if (question == "sbp4") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Disregards need for communication at time of transition"),
            SizedBox(height: 5),
            Text(
                "Does not respond to requests of caregivers in other delivery systems"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Inconsistently utilizes available resources to coordinate and ensure safe and effective patient care within and across delivery systems"),
            SizedBox(height: 5),
            Text(
                "Written and verbal care plans during times of transition are incomplete or absent"),
            SizedBox(height: 5),
            Text(
                "Inefficient transitions of care lead to unnecessary expense or risk to a patient (e.g. duplication of tests, readmission)"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Recognizes the importance of communication during times of transition"),
            SizedBox(height: 5),
            Text(
                "Communication with future caregivers is present but with lapses in pertinent or timely information"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Appropriately utilizes available resources to coordinate care and ensures safe and effective patient care within and across delivery systems"),
            SizedBox(height: 5),
            Text(
                "Proactively communicates with past and future caregivers to ensure continuity of care"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Coordinates care within and across health delivery systems to optimize patient safety, increase efficiency and ensure high quality patient outcomes"),
            SizedBox(height: 5),
            Text(
                "Anticipates needs of patient, caregivers and future care providers and takes appropriate steps to address those needs"),
            SizedBox(height: 5),
            Text("Role models and teaches effective transitions of care"),
          ],
        ),
      );
    } else if (question == "pbl1") {
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
                "Unwilling to self-reflect upon one’s practice or performance"),
            SizedBox(height: 5),
            Text(
                "Not concerned with opportunities for learning and self-improvement"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Unable to self-reflect upon one’s practice or performance"),
            SizedBox(height: 5),
            Text("Misses opportunities for learning and self-improvement"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Inconsistently self-reflects upon one’s practice or performance and inconsistently acts upon those reflections"),
            SizedBox(height: 5),
            Text(
                "Inconsistently acts upon opportunities for learning and self-improvement"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Regularly self-reflects upon one’s practice or performance and consistently acts upon those reflections to improve practice"),
            SizedBox(height: 5),
            Text(
                "Recognizes sub-optimal practice or performance as an opportunity for learning and self-improvement"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Regularly self-reflects and seeks external validation regarding this reflection to maximize practice improvement"),
            SizedBox(height: 5),
            Text(
                "Actively engages in self-improvement efforts and reflects upon the experience"),
          ],
        ),
      );
    } else if (question == "pbl2") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Disregards own clinical performance data"),
            SizedBox(height: 5),
            Text(
                "Demonstrates no inclination to participate in or even consider the results of quality improvement efforts"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Limited awareness of or desire to analyze own clinical performance data"),
            SizedBox(height: 5),
            Text("Nominally participates in a quality improvement projects"),
            SizedBox(height: 5),
            Text(
                "Not familiar with the principles, techniques or importance of quality improvement"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Analyzes own clinical performance data and identifies opportunities for improvement"),
            SizedBox(height: 5),
            Text("Effectively participates in a quality improvement project"),
            SizedBox(height: 5),
            Text(
                "Understands common principles and techniques of quality improvement and appreciates the responsibility to assess and improve care for a panel of patients"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Analyzes own clinical performance data and actively works to improve performance"),
            SizedBox(height: 5),
            Text("Actively engages in quality improvement initiatives"),
            SizedBox(height: 5),
            Text(
                "Demonstrates the ability to apply common principles and techniques of quality improvement to improve care for a panel of patients"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Actively monitors clinical performance through various data sources"),
            SizedBox(height: 5),
            Text("Is able to lead a quality improvement project"),
            SizedBox(height: 5),
            Text(
                "Utilizes common principles and techniques of quality improvement to continuously improve care for a panel of patients"),
          ],
        ),
      );
    } else if (question == "pbl3") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Never solicits feedback"),
            SizedBox(height: 5),
            Text("Actively resists feedback from others"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Rarely seeks feedback"),
            SizedBox(height: 5),
            Text("Responds to unsolicited feedback in a defensive fashion"),
            SizedBox(height: 5),
            Text(
                "Temporarily or superficially adjusts performance based on feedback"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Solicits feedback only from supervisors"),
            SizedBox(height: 5),
            Text("Is open to unsolicited feedback"),
            SizedBox(height: 5),
            Text("Inconsistently incorporates feedback"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Solicits feedback from all members of the interprofessional team and patients"),
            SizedBox(height: 5),
            Text("Welcomes unsolicited feedback"),
            SizedBox(height: 5),
            Text("Consistently incorporates feedback"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Performance continuously reflects incorporation of solicited and unsolicited feedback"),
            SizedBox(height: 5),
            Text("Able to reconcile disparate or conflicting feedback"),
          ],
        ),
      );
    } else if (question == "pbl4") {
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
                "Fails to acknowledge uncertainty and reverts to a reflexive patterned response even when inaccurate"),
            SizedBox(height: 5),
            Text("Fails to seek or apply evidence when necessary"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Rarely “slows down” to reconsider an approach to a problem, ask for help, or seek new information"),
            SizedBox(height: 5),
            Text(
                "Can translate medical information needs into well-formed clinical questions with assistance"),
            SizedBox(height: 5),
            Text(
                "Unfamiliar with strengths and weaknesses of the medical literature"),
            SizedBox(height: 5),
            Text(
                "Has limited awareness of or ability to use information technology"),
            SizedBox(height: 5),
            Text(
                "Accepts the findings of clinical research studies without critical appraisal"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Inconsistently “slows down” to reconsider an approach to a problem, ask for help, or seek new information"),
            SizedBox(height: 5),
            Text(
                "Can translate medical information needs into well-formed clinical questions independently"),
            SizedBox(height: 5),
            Text(
                "Aware of the strengths and weaknesses of medical information resources but utilizes information technology without sophistication"),
            SizedBox(height: 5),
            Text(
                "With assistance, appraises clinical research reports, based on accepted criteria"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Routinely “slows down” to reconsider an approach to a problem, ask for help, or seek new information"),
            SizedBox(height: 5),
            Text(
                "Routinely translates new medical information needs into well-formed clinical questions"),
            SizedBox(height: 5),
            Text("Utilizes information technology with sophistication"),
            SizedBox(height: 5),
            Text(
                "Independently appraises clinical research reports based on accepted criteria"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Searches medical information resources efficiently, guided by the characteristics of clinical questions"),
            SizedBox(height: 5),
            Text(
                "Role models how to appraise clinical research reports based on accepted criteria"),
            SizedBox(height: 5),
            Text(
                "Has a systematic approach to track and pursue emerging clinical questions"),
          ],
        ),
      );
    } else if (question == "prof1") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Lacks empathy and compassion for patients and caregivers"),
            SizedBox(height: 5),
            Text(
                "Disrespectful in interactions with patients, caregivers and members of the interprofessional team"),
            SizedBox(height: 5),
            Text("Sacrifices patient needs in favor of own self-interest"),
            SizedBox(height: 5),
            Text(
                "Blatantly disregards respect for patient privacy and autonomy"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Inconsistently demonstrates empathy, compassion and respect for patients and caregivers"),
            SizedBox(height: 5),
            Text(
                "Inconsistently demonstrates responsiveness to patients’ and caregivers’ needs in an appropriate fashion"),
            SizedBox(height: 5),
            Text("Inconsistently considers patient privacy and autonomy"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Consistently respectful in interactions with patients, caregivers and members of the interprofessional team, even in challenging situations"),
            SizedBox(height: 5),
            Text(
                "Is available and responsive to needs and concerns of patients, caregivers and members of the interprofessional team to ensure safe and effective care"),
            SizedBox(height: 5),
            Text("Emphasizes patient privacy and autonomy in all interactions"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Demonstrates empathy, compassion and respect to patients and caregivers in all situations"),
            SizedBox(height: 5),
            Text(
                "Anticipates, advocates for, and proactively works to meet the needs of patients and caregivers"),
            SizedBox(height: 5),
            Text(
                "Demonstrates a responsiveness to patient needs that supersedes self-interest"),
            SizedBox(height: 5),
            Text(
                "Positively acknowledges input of members of the interprofessional team and incorporates that input into plan of care as appropriate"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Role models compassion, empathy and respect for patients and caregivers"),
            SizedBox(height: 5),
            Text(
                "Role models appropriate anticipation and advocacy for patient and caregiver needs"),
            SizedBox(height: 5),
            Text(
                "Fosters collegiality that promotes a high-functioning interprofessional team"),
            SizedBox(height: 5),
            Text(
                "Teaches others regarding maintaining patient privacy and respecting patient autonomy"),
          ],
        ),
      );
    } else if (question == "prof2") {
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
                "Is consistently unreliable in completing patient care responsibilities or assigned administrative tasks"),
            SizedBox(height: 5),
            Text("Shuns responsibilities expected of a physician professional"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Completes most assigned tasks in a timely manner but may need multiple reminders or other support"),
            SizedBox(height: 5),
            Text(
                "Accepts professional responsibility only when assigned or mandatory"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Completes administrative and patient care tasks in a timely manner in accordance with local practice and/or policy"),
            SizedBox(height: 5),
            Text(
                "Completes assigned professional responsibilities without questioning or the need for reminders"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Prioritizes multiple competing demands in order to complete tasks and responsibilities in a timely and effective manner"),
            SizedBox(height: 5),
            Text(
                "Willingness to assume professional responsibility regardless of the situation"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Role models prioritizing multiple competing demands in order to complete tasks and responsibilities in a timely and effective manner"),
            SizedBox(height: 5),
            Text(
                "Assists others to improve their ability to prioritize multiple, competing tasks"),
          ],
        ),
      );
    } else if (question == "prof3") {
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
                "Is insensitive to differences related to culture, ethnicity, gender, race, age, and religion in the patient/caregiver encounter"),
            SizedBox(height: 5),
            Text(
                "Is unwilling to modify care plan to account for a patient’s unique characteristics and needs"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Is sensitive to and has basic awareness of differences related to culture, ethnicity, gender, race, age and religion in the patient/caregiver encounter"),
            SizedBox(height: 5),
            Text(
                "Requires assistance to modify care plan to account for a patient’s unique characteristics and needs"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Seeks to fully understand each patient’s unique characteristics and needs based upon culture, ethnicity, gender, religion, and personal preference"),
            SizedBox(height: 5),
            Text(
                "Modifies care plan to account for a patient’s unique characteristics and needs with partial success"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Recognizes and accounts for the unique characteristics and needs of the patient/caregiver"),
            SizedBox(height: 5),
            Text(
                "Appropriately modifies care plan to account for a patient’s unique characteristics and needs"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Role models professional interactions to negotiate differences related to a patient’s unique characteristics or needs"),
            SizedBox(height: 5),
            Text(
                "Role models consistent respect for patient’s unique characteristics and needs"),
          ],
        ),
      );
    } else if (question == "prof4") {
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
                "Dishonest in clinical interactions, documentation, research, or scholarly activity"),
            SizedBox(height: 5),
            Text("Refuses to be accountable for personal actions"),
            SizedBox(height: 5),
            Text("Does not adhere to basic ethical principles"),
            SizedBox(height: 5),
            Text("Blatantly disregards formal policies or procedures"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Honest in clinical interactions, documentation, research, and scholarly activity. Requires oversight for professional actions"),
            SizedBox(height: 5),
            Text(
                "Has a basic understanding of ethical principles, formal policies and procedures, and does not intentionally disregard them"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Honest and forthright in clinical interactions, documentation, research, and scholarly activity"),
            SizedBox(height: 5),
            Text("Demonstrates accountability for the care of patients"),
            SizedBox(height: 5),
            Text(
                "Adheres to ethical principles for documentation, follows formal policies and procedures, acknowledges and limits conflict of interest, and upholds ethical expectations of research and scholarly activity"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Honest and forthright in clinical interactions, documentation, research, and scholarly activity"),
            SizedBox(height: 5),
            Text("Demonstrates accountability for the care of patients"),
            SizedBox(height: 5),
            Text(
                "Adheres to ethical principles for documentation, follows formal policies and procedures, acknowledges and limits conflict of interest, and upholds ethical expectations of research and scholarly activity"),
            SizedBox(height: 5),
            Text(
                "Demonstrates integrity, honesty, and accountability to patients, society and the profession"),
            SizedBox(height: 5),
            Text(
                "Actively manages challenging ethical dilemmas and conflicts of interest"),
            SizedBox(height: 5),
            Text(
                "Identifies and responds appropriately to lapses of professional conduct among peer group"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Assists others in adhering to ethical principles and behaviors including integrity, honesty, and professional responsibility"),
            SizedBox(height: 5),
            Text(
                "Role models integrity, honesty, accountability and professional conduct in all aspects of professional life"),
            SizedBox(height: 5),
            Text("Regularly reflects on personal professional conduct"),
          ],
        ),
      );
    } else if (question == "ics1") {
      return const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Critical Deficiencies",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Ignores patient preferences for plan of care"),
            SizedBox(height: 5),
            Text(
                "Makes no attempt to engage patient in shared decision-making"),
            SizedBox(height: 5),
            Text(
                "Routinely engages in antagonistic or counter-therapeutic relationships with patients and caregivers"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Engages patients in discussions of care plans and respects patient preferences when offered by the patient, but does not actively solicit preferences"),
            SizedBox(height: 5),
            Text(
                "Attempts to develop therapeutic relationships with patients and caregivers but is often unsuccessful"),
            SizedBox(height: 5),
            Text("Defers difficult or ambiguous conversations to others"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Engages patients in shared decision making in uncomplicated conversations"),
            SizedBox(height: 5),
            Text(
                "Requires assistance facilitating discussions in difficult or ambiguous conversations"),
            SizedBox(height: 5),
            Text(
                "Requires guidance or assistance to engage in communication with persons of different socioeconomic and cultural backgrounds"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Identifies and incorporates patient preference in shared decision making across a wide variety of patient care conversations"),
            SizedBox(height: 5),
            Text(
                "Quickly establishes a therapeutic relationship with patients and caregivers, including persons of different socioeconomic and cultural backgrounds"),
            SizedBox(height: 5),
            Text("Incorporates patient-specific preferences into plan of care"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Role models effective communication and development of therapeutic relationships in both routine and challenging situations"),
            SizedBox(height: 5),
            Text(
                "Models cross-cultural communication and establishes therapeutic relationships with persons of diverse socioeconomic backgrounds"),
          ],
        ),
      );
    } else if (question == "ics2") {
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
                "Utilizes communication strategies that hamper collaboration and teamwork"),
            SizedBox(height: 5),
            Text(
                "Verbal and/or non-verbal behaviors disrupt effective collaboration with team members"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Uses unidirectional communication that fails to utilize the wisdom of the team"),
            SizedBox(height: 5),
            Text("Resists offers of collaborative input"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Inconsistently engages in collaborative communication with appropriate members of the team"),
            SizedBox(height: 5),
            Text(
                "Inconsistently employs verbal, non-verbal, and written communication strategies that facilitate collaborative care"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Consistently and actively engages in collaborative communication with all members of the team"),
            SizedBox(height: 5),
            Text(
                "Verbal, non-verbal and written communication consistently acts to facilitate collaboration with the team to enhance patient care"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Role models and teaches collaborative communication with the team to enhance patient care, even in challenging settings and with conflicting team member opinions"),
          ],
        ),
      );
    } else if (question == "ics3") {
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
                "Health records are absent or missing significant portions of important clinical data"),
            SizedBox(height: 10),
            Text(
              "Early Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Health records are disorganized and inaccurate"),
            SizedBox(height: 10),
            Text(
              "Advanced Learner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Health records are organized and accurate but are superficial and miss key data or fail to communicate clinical reasoning"),
            SizedBox(height: 10),
            Text(
              "Ready for Unsupervised Practice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Health records are organized, accurate, comprehensive, and effectively communicate clinical reasoning"),
            SizedBox(height: 5),
            Text("Health records are succinct, relevant, and patient specific"),
            SizedBox(height: 10),
            Text(
              "Aspirational",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
                "Role models and teaches importance of organized, accurate and comprehensive health records that are succinct and patient specific"),
          ],
        ),
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
