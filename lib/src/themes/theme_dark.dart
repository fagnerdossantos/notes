import 'package:flutter/material.dart';

class ThemeDark {
  // Getter
  ThemeData get dark => _dark;

  final ThemeData _dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: const Color.fromARGB(255, 2, 79, 196),

    // Text
    textTheme: const TextTheme(
      // Titles
      titleLarge: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),

      titleMedium: TextStyle(
        fontSize: 25,
        color: Colors.blueGrey,
        fontWeight: FontWeight.bold,
      ),

      titleSmall: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),

      // Small -- normal text --
      bodySmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
  );
}
