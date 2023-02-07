import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  final int index;
  const PopUpMenu({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) => {
        //value == 2 ? controller.delete(index) : false,
      },

      // Builder
      itemBuilder: (_) => [
        // Favorite button
        const PopupMenuItem(
          value: 1,
          child: Icon(
            Icons.favorite,
          ),
        ),

        // Delete button
        const PopupMenuItem(
          value: 2,
          child: Icon(
            Icons.delete,
          ),
        ),
      ],
    );
  }
}
