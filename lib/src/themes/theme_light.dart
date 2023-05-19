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

    cardTheme: CardTheme(
      elevation: 8,
      shadowColor: blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: white,
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: white,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(black),
      ),
    ),

    textTheme: TextTheme(
      // LARGE --Titles--
      displayLarge: TextStyle(
        color: black.withOpacity(0.8),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),

      // MEDIUM --Subtitles--
      displayMedium: TextStyle(
        color: black.withOpacity(0.7),
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),

      // LARGE --Normal text--
      bodyLarge: TextStyle(
        color: black.withOpacity(0.8),
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),

      // MEDIUM --Small text--
      bodyMedium: const TextStyle(
        color: black,
        fontSize: 20,
      ),
    ),
  );
}
