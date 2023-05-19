import 'package:flutter/material.dart';
import 'package:notes/src/app/global/components/selected_item_drawer_light.dart';

import '../../../../utils/size.dart';

class CustomDrawer extends StatelessWidget {
  final Size size;
  const CustomDrawer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final List drawerItems = [
      [Icons.all_inbox_outlined, "All Notes"],
      [Icons.favorite_outline, "Favorites"],
      [Icons.delete_outline, "Trash"]
    ];

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
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),

            //
            const VerticalSpace(height: 20),

            Expanded(
              child: Column(
                children: drawerItems
                    .map((element) => SelectedItemDrawer(
                        index: drawerItems.indexOf(element),
                        icon: element[0],
                        label: element[1]))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
