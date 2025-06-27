import "package:flutter/material.dart";
import "package:makerere_app/widgets/view_survey.dart";

class ViewSurveysScreen extends StatelessWidget {
  const ViewSurveysScreen(
      {super.key, required this.results, required this.role});

  final Map<String, dynamic> results;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Review Details",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ViewSurvey(results: results, role: role),
        ));
  }
}

/* class: "mmed1"
email: "matthew.pullen@gmail.com"
firstname: "Matthew"
lastname: "TeststudentMMed2"
meetings:
    |__0:
      |__date: "2023-10-01 00:00:00.000"
      |__metWith: "David Boulware"
      |__notes: "Test notes 1"
reviews:
    |__0:
      |__department: "Infectious Diseases"
      |__interpersonal:
        |__ics1: 1
        |__ics1Comments: "ICSTest1"
        |__ics2: 2
        |__ics2Comments: "ICSTest2"
        |__ics3: 3
        |__ics3Comments: "ICSTest3"
        |__icsTotal: 6
      |__medicalKnowledge:
        |__mk1: 1
        |__mks1Comments: "MKTest1"
        |__mk2: 2
        |__mks2Comments: "MKTest2"
        |__mksTotal: 3
      |__patientCare:
        |__pc1: 1
        |__pcs1Comments: "PCTest1"
        |__pc2: 2
        |__pcs2Comments: "PCTest2"
        |__pc3: 3
        |__pcs3Comments: "PCTest3"
        |__pc4: 4
        |__pcs4Comments: "PCTest4"
        |__pc5: 5
        |__pcs5Comments: "PCTest5"
        |__pcTotal: 15
      |__practiceBasedLearning:
        |__pbl1: 1
        |__pbl1Comments: "PBLTest1"
        |__pbl2: 2
        |__pbl2Comments: "PBLTest2"
        |__pbl3: 3
        |__pbl3Comments: "PBLTest3"
        |__pbl4: 4
        |__pbl4Comments: "PBLTest4"
        |__pblTotal: 10
      |__professionalism:
        |__prof1: 1
        |__prof1Comments: "ProTest1"
        |__prof2: 2
        |__prof2Comments: "ProTest2"
        |__prof3: 3
        |__prof3Comments: "ProTest3"
        |__prof4: 4
        |__prof4Comments: "ProTest4"
        |__profTotal: 10
      |__reviewer: "Matthew Pullenfaculty"
      |__studentFirstname: "Matthew"
      |__studentLastname: "TeststudentMMed2"
      |__studentId: "NzJ098asDFfsdfa"
      |__systemsBasedPractice:
        |__sbp1: 1
        |__sbp1Comments: "SBPTest1"
        |__sbp2: 2
        |__sbp2Comments: "SBPTest2"
        |__sbp3: 3
        |__sbp3Comments: "SBPTest3"
        |__sbp4: 4
        |__sbp4Comments: "SBPTest4"
        |__sbpTotal: 10
      |__timestamp: "2023-10-01 00:00:00.000"
role: "student"
schedule:
    |__rotation1: "Infectious Diseases"
    |__rotation2: "Internal Medicine"
    |__rotation3: "Pediatrics"
    |__rotation4: "Psychiatry"
    |__rotation5: "Surgery"
    |__rotation6: "Family Medicine"
    |__rotation7: "Obstetrics and Gynecology"
    |__rotation8: "Emergency Medicine" */
