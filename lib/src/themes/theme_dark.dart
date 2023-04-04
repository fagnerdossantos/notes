import 'package:flutter/material.dart';

class ThemeDark {
  // Getter
  ThemeData get dark => _themeData;

  // Texts
  final ThemeData _themeData = ThemeData(
    // APP BAR
    appBarTheme: const AppBarTheme(
      // Colors
      backgroundColor: Colors.black,

      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),

      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    scaffoldBackgroundColor: Colors.black,

    // CARD
    cardTheme: CardTheme(
      elevation: 5,
      color: Colors.deepPurple,
      shadowColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.black,
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.black,
    ),

    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple),
      ),
    ),

    // Text Style
    textTheme: const TextTheme(
      /*  TITLES */

      // Large
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),

      // Small
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),

      /* Body */

      // Medium
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),

      // Small
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  );
}
