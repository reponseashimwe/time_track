import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/time_entry_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeEntryProvider(),
      child: MaterialApp(
        title: 'Time Tracking App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFE91E63), // Pink
            primary: const Color(0xFFE91E63), // Pink
            secondary: const Color(0xFF9C27B0), // Purple
            tertiary: const Color(0xFFF48FB1), // Light Pink
            background: Colors.white, // White background
          ),
          useMaterial3: true,
          fontFamily: 'Quicksand',
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
            displayMedium: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
            displaySmall: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
            headlineLarge: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
            headlineMedium: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
            headlineSmall: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontFamily: 'Quicksand'),
            titleSmall: TextStyle(fontFamily: 'Quicksand'),
            bodyLarge: TextStyle(fontFamily: 'Quicksand'),
            bodyMedium: TextStyle(fontFamily: 'Quicksand'),
            bodySmall: TextStyle(fontFamily: 'Quicksand'),
          ),
          cardTheme: CardTheme(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFE91E63),
            foregroundColor: Colors.white,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xFF9C27B0),
            foregroundColor: Colors.white,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
