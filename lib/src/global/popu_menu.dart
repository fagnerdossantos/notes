import 'package:flutter/material.dart';
import 'package:notes/src/database/notes_db.dart';
import 'package:provider/provider.dart';

class PopUpMenu extends StatelessWidget {
  final int index;
  const PopUpMenu({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // DB Connection
    final controller = context.read<Database>();

    return PopupMenuButton(
      onSelected: (value) => {
        value == 2 ? controller.delete(index) : false,
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
