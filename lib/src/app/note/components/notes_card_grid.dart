import 'package:flutter/material.dart';
import 'package:notes/src/app/note/components/custom_notes_card.dart';
import 'package:notes/src/app/note/models/note_model.dart';

class NotesCardGrid extends StatelessWidget {
  final List<NoteModel> items;
  const NotesCardGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
  // Number of columns
  crossAxisCount: 2,

  // Width/height ratio of each child
  childAspectRatio: .56,

  // Item Builder
  children: List.generate(items.length, (index) {
    // Even or Odd
    bool isEvenRow = (index ~/ 2) % 2 == 0;

    if (isEvenRow) {
      // Even
      return (index % 2 == 0)
          ? CustomNotesCard(
              isLarge: true,
              model: items[index],
            )
          : CustomNotesCard(
              isLarge: false,
              model: items[index],
            );
    } else {
      // Odd
      return (index % 2 == 0)
          ? CustomNotesCard(
              isLarge: false,
              model: items[index],
            )
          : CustomNotesCard(
              isLarge: true,
              model: items[index],
            );
    }
  }),
);
  }
}
