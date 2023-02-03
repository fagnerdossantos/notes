import 'package:flutter/material.dart';
import 'package:notes/src/database/notes_db.dart';
import 'package:notes/src/global/no_data_image.dart';
import 'package:notes/src/notes/components/notes_card.dart';
import 'package:provider/provider.dart';

class NotesBuilderComponent extends StatelessWidget {
  const NotesBuilderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // DB connection
    final controller = context.watch<Database>();

    return controller.notesList.isEmpty
        ? const NoDataImage()
        : GridView.builder(
            // Delegate
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: .7,
            ),

            // Count
            itemCount: controller.notesList.length,

            // Builder
            itemBuilder: ((_, index) {
              return GestureDetector(
                // Action
                onTap: () =>
                    Navigator.pushNamed(context, "/note", arguments: index),

                // Content
                child: NotesCard(
                  index: index,
                ),
              );
            }),
          );
  }
}
