// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        Drawer,
        EdgeInsets,
        Expanded,
        Icons,
        ListView,
        Padding,
        Row,
        SafeArea,
        StatelessWidget,
        Text,
        Theme,
        Widget;

import '../../../core/utils/colors.dart';
import '../buttons/clickable_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Default Padding
    const EdgeInsets dfPadding = EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 5,
    );

    return Drawer(
      //
      backgroundColor: DefaultColors.white,

      // Use safe area
      child: SafeArea(
        child: Padding(
          padding: dfPadding,

          // Content column
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      "Notes",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),

              // Text
              Expanded(
                flex: 10,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_, index) {
                    return ClickableTile(
                      index: index,
                      icon: data[index][0],
                      label: data[index][1],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List data = [
  [
    Icons.all_inbox,
    "All notes",
  ],
  [
    Icons.favorite_border,
    "Favorite",
  ],
];
