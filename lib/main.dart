import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makerere_app/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromRGBO(255, 0, 0, 50),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(255, 0, 0, 100),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
