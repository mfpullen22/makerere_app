import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/mak_logo.png",
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Orientation Materials"),
            ),
          ),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Semester Schedule"),
            ),
          ),
        ],
      ),
    );
  }
}
