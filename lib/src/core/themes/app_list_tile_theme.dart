import 'package:flutter/material.dart'
    show ListTileThemeData, RoundedRectangleBorder;

import '../utils/utils.dart';

final class AppListTileTheme {
  // Static Instance
  static final instance = AppListTileTheme._();
  AppListTileTheme._();

  final theme = ListTileThemeData(
    // Rounded shape
    shape: RoundedRectangleBorder(borderRadius: RoundedShape.small),

    selectedColor: DefaultColors.amber,
    selectedTileColor: DefaultColors.blue,
  );
}
