import 'package:flutter/material.dart';
import 'package:notes/src/providers/selected_item_drawer_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';

class SelectedItemDrawer extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  const SelectedItemDrawer({
    super.key,
    required this.index,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    // Is Selected Controller
    final controller = context.watch<SelectedItemDrawerProvider>();
    bool isSelected = controller.selectedIndex == index;

    return InkWell(
      // Action -- change selection --
      onTap: () => controller.changeSelectedIndex(index),

      child: AnimatedContainer(
        // Alignment
        padding: const EdgeInsets.all(16),

        duration: const Duration(milliseconds: 500),

        decoration: BoxDecoration(
          color: (isSelected ? amber : white),
          borderRadius: BorderRadius.circular(30),
        ),

        child: Row(
          children: [
            // Icon
            Icon(
              icon,
              size: 30,
              color: black,
            ),

            const SizedBox(width: 10),

            // Label text
            Text(
              label,
              style: (isSelected)
                  ? Theme.of(context).textTheme.bodyLarge
                  : Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
