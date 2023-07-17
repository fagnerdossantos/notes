import 'package:flutter/material.dart' show AppBarTheme;

import '../utils/colors.dart';
import 'app_icon_theme.dart';

final class AppBarThemeClass {
  // Static Instance
  static final instance = AppBarThemeClass._();
  AppBarThemeClass._();

  final theme = AppBarTheme(
    iconTheme: AppIconTheme.instance.iconTheme,
    backgroundColor: DefaultColors.transparent,
    centerTitle: true,
    elevation: 0,
  );
}
