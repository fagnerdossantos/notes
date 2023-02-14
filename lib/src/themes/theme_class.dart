import 'package:flutter/material.dart';
import 'package:notes/src/themes/theme_dark.dart';
import 'package:notes/src/themes/theme_light.dart';

class ThemeClass extends ChangeNotifier {
  final ThemeDark _dark;
  final ThemeLight _light;

  ThemeClass(this._dark, this._light);

  bool isDark = false;

  ThemeData get theme => isDark ? _dark.dark : _light.light;

  void toggle() {
    isDark = !isDark;
    notifyListeners();
  }
}
