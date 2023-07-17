import 'package:flutter/material.dart'
    show
        ButtonStyle,
        ElevatedButtonThemeData,
        FloatingActionButtonThemeData,
        MaterialStatePropertyAll,
        RoundedRectangleBorder;

import '../utils/utils.dart';

final class AppButtonsTheme {
  // Static Instance
  static final instance = AppButtonsTheme._();
  AppButtonsTheme._();

  final FloatingActionButtonThemeData flbtheme =
      const FloatingActionButtonThemeData(
    backgroundColor: DefaultColors.black,
  );

  final ElevatedButtonThemeData elvTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(DefaultColors.black),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: RoundedShape.small,
        ),
      ),
    ),
  );
}
