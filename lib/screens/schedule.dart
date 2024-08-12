import "package:makerere_app/providers/schedule_service.dart";
import "package:makerere_app/data/dropdown_items.dart";
import "package:flutter/material.dart";

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late List<DropdownMenuItem<String>> currentList;
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    // Initialize with an empty list or one of the categories as default.
    currentList = [];
    dropdownValue = null;
  }

  void updateDropdown(List<DropdownMenuItem<String>> newList) {
    setState(() {
      currentList = newList;
      dropdownValue = newList.isNotEmpty ? newList.first.value : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDropdownDisabled = currentList.isEmpty;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              textAlign: TextAlign.center,
              "View Rotation Schedule By:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => updateDropdown(rotations),
                child: const Text("Rotation"),
              ),
              TextButton(
                onPressed: () => updateDropdown(classes),
                child: const Text("Class Year"),
              ),
              TextButton(
                onPressed: () => updateDropdown(students),
                child: const Text("Student"),
              ),
            ],
          ),
          DropdownButtonFormField<String>(
            value: dropdownValue,
            hint: const Text("Select an option"),
            items: isDropdownDisabled ? null : currentList,
            onChanged: isDropdownDisabled
                ? null
                : (String? newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10),
            ),
            isExpanded: true,
          ),
          if (currentList == classes)
            Expanded(
              child: getScheduleByYear(dropdownValue ?? "mmed1"),
            ),
          if (currentList == students)
            Expanded(
              child: getScheduleByStudent(dropdownValue ?? "mmed1"),
            ),
          if (currentList == rotations)
            const Expanded(
              child: Text("Rotation Schedule Pending"),
            ),
        ],
      ),
    );
  }
}
