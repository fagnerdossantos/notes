import 'package:flutter/material.dart' show Colors, ThemeData;

import 'app_list_tile_theme.dart';
import 'app_text_theme.dart';

class AppTheme {
  // Static Instance
  static final instance = AppTheme._();
  AppTheme._();

  // Texts
  final ThemeData theme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.deepPurple,
    // Card style

    // Texts
    textTheme: AppTextTheme.instance.theme,

    listTileTheme: AppListTileTheme.instance.theme,
  );
}
