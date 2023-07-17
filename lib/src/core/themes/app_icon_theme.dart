import 'package:flutter/material.dart'
    show
        ButtonStyle,
        IconButtonThemeData,
        IconThemeData,
        MaterialStatePropertyAll;

import '../utils/colors.dart';

final class AppIconTheme {
  // Static Instance
  static final instance = AppIconTheme._();
  AppIconTheme._();

  final IconThemeData iconTheme = const IconThemeData(
    color: DefaultColors.black,
    size: 20,
  );

  final IconButtonThemeData iconButtonTheme = const IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(DefaultColors.black),
      iconSize: MaterialStatePropertyAll(20),
    ),
  );
}
