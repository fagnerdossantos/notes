import 'package:flutter/material.dart';
import 'package:notes/src/app/global/components/selected_item_drawer_light.dart';
import 'package:notes/utils/consts.dart';

class CustomDrawer extends StatelessWidget {
  final Size size;
  const CustomDrawer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),

        // Content
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Theme",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),

            //
            const VerticalSpace(height: 20),

            const Expanded(
              child: SelectedItemDrawer(),
            ),
          ],
        ),
      ),
    );
  }
}
