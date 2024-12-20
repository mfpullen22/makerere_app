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
              "View Rotation Schedule By:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => updateDropdown(rotations),
                child: const Text("Rotation"),
              ),
              TextButton(
                onPressed: () => updateDropdown(students),
                child: const Text("Student"),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          Expanded(
            child: Builder(
              builder: (context) {
                if (currentList == rotations && dropdownValue != null) {
                  // Show schedule by rotation (organized by schedule period)
                  return getScheduleByRotation(dropdownValue!);
                } else if (currentList == students && dropdownValue != null) {
                  // Show schedule by student
                  return getScheduleByStudent(dropdownValue!);
                } else {
                  return const Center(
                    child: Text("Please select a filter and option"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
