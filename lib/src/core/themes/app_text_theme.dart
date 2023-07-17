import 'package:flutter/material.dart' show FontWeight, TextStyle, TextTheme;

import '../utils/utils.dart';

final class AppTextTheme {
  // Static Instance
  static final instance = AppTextTheme._();
  AppTextTheme._();

  final TextTheme theme = TextTheme(
    // -- Titles --
    titleLarge: TextStyle(
      color: DefaultColors.black.withOpacity(.8),
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),

    titleSmall: TextStyle(
      color: DefaultColors.black.withOpacity(.7),
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),

    // LARGE --Normal text--
    bodyLarge: TextStyle(
      color: DefaultColors.black.withOpacity(.8),
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),

    // MEDIUM --Small text--
    bodySmall: TextStyle(
      color: DefaultColors.black.withOpacity(.8),
      fontSize: 20,
      fontWeight: FontWeight.normal,
    ),
  );
}
