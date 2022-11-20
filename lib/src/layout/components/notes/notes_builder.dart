import 'package:flutter/material.dart';

import 'package:notes/src/layout/components/notes/note_box.dart';
import 'package:notes/src/layout/components/notes/notes_void.dart';

class NotesBuilder extends StatelessWidget {
  const NotesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // Len
    const int len = 4;

    return len == 0
        ? const NotesVoid()
        : GridView.builder(
            // List len
            itemCount: len,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.4,
            ),

            // List Builder
            itemBuilder: (context, int index) {
              return const NoteBox();
            },
          );
  }
}
