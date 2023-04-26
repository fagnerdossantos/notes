import 'package:flutter/material.dart';
import 'package:notes/utils/consts.dart';

class ThemeLight {
  // Getter
  ThemeData get light => _themeData;

  // Texts
  final ThemeData _themeData = ThemeData(
    // APP BAR
    appBarTheme: const AppBarTheme(
      // Colors
      backgroundColor: white,

      actionsIconTheme: IconThemeData(color: black),

      iconTheme: IconThemeData(
        color: black,
      ),
    ),

    scaffoldBackgroundColor: white,

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: black,
    ),

    // CARD
    cardTheme: CardTheme(
      elevation: 8,
      shadowColor: blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: white,
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: white,
    ),

    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(black),
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
        color: black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),

      // Small
      bodySmall: TextStyle(
        color: black,
        fontSize: 20,
      ),
    ),
  );
}
