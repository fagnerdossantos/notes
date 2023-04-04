import 'package:flutter/material.dart';

class ThemeLight {
  // Getter
  ThemeData get light => _themeData;

  // Texts
  final ThemeData _themeData = ThemeData(
    // APP BAR
    appBarTheme: const AppBarTheme(
      // Colors
      backgroundColor: Colors.white,

      actionsIconTheme: IconThemeData(
        color: Colors.black,
      ),

      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),

    scaffoldBackgroundColor: Colors.white,

    // CARD
    cardTheme: CardTheme(
      elevation: 8,
      shadowColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),

    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),
      ),
    ),

    // Text Style
    textTheme: const TextTheme(
      /*  TITLES */

      // Large
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),

      // Small
      titleSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),

      /* Body */

      // Medium
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),

      // Small
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
  );
}
