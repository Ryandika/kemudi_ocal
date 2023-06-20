import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth_page.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 38, 89, 126),
);

// final darkColorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 169, 121, 15),
// );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // darkTheme: ThemeData.dark(),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.background,
          foregroundColor: colorScheme.primary,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
          backgroundColor: colorScheme.primary,
          selectedItemColor: colorScheme.onPrimary,
          selectedIconTheme:
              IconThemeData(color: colorScheme.onPrimary, size: 30),
          unselectedItemColor: colorScheme.inversePrimary,
          unselectedIconTheme: const IconThemeData(size: 20),
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
        ),
        textTheme: ThemeData()
            .textTheme
            .copyWith(bodyMedium: TextStyle(color: colorScheme.onPrimaryContainer)),
        iconTheme: const IconThemeData().copyWith(
          color: colorScheme.onPrimaryContainer,
        ),
        scaffoldBackgroundColor: colorScheme.background,
      ),
      // themeMode: ThemeMode.system, //default
      home: AuthPage(),
    );
  }
}
