import 'package:flutter/material.dart';
import 'package:notes/src/notes/components/notes_card.dart';

class NotesBuilderComponent extends StatelessWidget {
  const NotesBuilderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Delegate
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: .7,
      ),

      // Count
      itemCount: 8,

      // Builder
      itemBuilder: ((context, index) {
        return NotesCard(
          index: index,
        );
      }),
    );
  }
}
