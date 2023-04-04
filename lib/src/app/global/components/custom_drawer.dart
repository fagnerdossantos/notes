import 'package:flutter/material.dart';
import 'package:notes/src/app/global/components/selected_item_drawer_light.dart';
import 'package:notes/src/themes/theme_class.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  final Size size;
  const CustomDrawer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    // Theme Controller
    final controller = context.watch<ThemeClass>();

    final bool isDark = controller.isDark;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),

        // Content
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Theme",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const ThemeSwitch(),
              ],
            ),

            //
            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: SelectedItemDrawer(
                isDark: isDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Theme Controller
    final controller = context.watch<ThemeClass>();

    final bool isDark = controller.isDark;

    return Switch(
      value: isDark,
      onChanged: (_) => controller.toggle(),
      activeColor: isDark ? Colors.deepPurple : Colors.amber.shade200,
    );
  }
}
