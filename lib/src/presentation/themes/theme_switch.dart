import 'package:flutter/material.dart';

class ThemeSwitch extends ChangeNotifier {
  ThemeSwitch.instance_();

  bool isDark = false;

  ThemeData get theme => isDark ? _dark : _light;

  final ThemeData _light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: const Color.fromRGBO(255, 15, 53, 1),
  );

  final ThemeData _dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: const Color.fromRGBO(43, 158, 179, 1),
  );

  void toggle() {
    isDark = !isDark;
    notifyListeners();
  }

  factory ThemeSwitch() => ThemeSwitch.instance_();
}
