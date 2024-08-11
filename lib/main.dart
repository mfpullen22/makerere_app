import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makerere_app/screens/auth.dart';
import 'package:makerere_app/screens/tabs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromRGBO(255, 0, 0, 50),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(255, 0, 0, 100),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return const TabsScreen();
          }

          return const AuthScreen();
        },
      ),
    );
  }
}
