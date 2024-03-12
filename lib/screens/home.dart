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
          )
        ],
      ),
    );
  }
}
