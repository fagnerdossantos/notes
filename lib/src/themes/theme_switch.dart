import 'package:flutter/material.dart';
import 'package:notes/src/themes/theme_class.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Theme Controller
    final controller = context.watch<ThemeClass>();

    return Switch(
      value: controller.isDark,
      onChanged: (_) => controller.toggle(),
    );
  }
}
