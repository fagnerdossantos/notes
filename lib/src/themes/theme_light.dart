import 'package:flutter/material.dart';

class ThemeLight {
  ThemeData get light => _light;

  final ThemeData _light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: const Color.fromARGB(255, 27, 240, 229),

    // Text
    textTheme: const TextTheme(
      // Titles
      titleLarge: TextStyle(
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),

      titleMedium: TextStyle(
        fontSize: 25,
        color: Colors.blueGrey,
        fontWeight: FontWeight.bold,
      ),

      titleSmall: TextStyle(
        fontSize: 24,
        color: Colors.black,
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
