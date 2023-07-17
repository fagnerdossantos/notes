import 'package:flutter/material.dart' show ThemeData;

import 'app_bar_theme.dart';
import 'app_buttons_theme.dart';
import 'app_icon_theme.dart';
import 'app_list_tile_theme.dart';
import 'app_text_theme.dart';
import 'card_theme.dart';

class AppTheme {
  // Static Instance
  static final instance = AppTheme._();
  AppTheme._();

  // Texts
  final ThemeData theme = ThemeData(
    // Floating action button
    floatingActionButtonTheme: AppButtonsTheme.instance.flbtheme,

    elevatedButtonTheme: AppButtonsTheme.instance.elvTheme,

    // Card style
    cardTheme: AppCardTheme.instance.theme,

    // Texts
    textTheme: AppTextTheme.instance.theme,

    // Icons
    iconTheme: AppIconTheme.instance.iconTheme,
    iconButtonTheme: AppIconTheme.instance.iconButtonTheme,

    appBarTheme: AppBarThemeClass.instance.theme,

    listTileTheme: AppListTileTheme.instance.theme,
  );
}
