import 'package:flutter/material.dart'
    show BuildContext, GridView, StatelessWidget, Widget;

import '../../../domain/models/note_model.dart';
import 'note_card_large.dart';
import 'note_card_small.dart';

class CardGrid extends StatelessWidget {
  final List<NoteModel> models;
  const CardGrid({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    // Default values
    const int crossAxisCount = 2;
    const double aspectRation = .56;

    bool isEvenRow(int number) => (number ~/ 2) % 2 == 0;
    bool isEven(int number) => number % 2 == 0;

    return GridView.count(
      // Number of columns
      crossAxisCount: crossAxisCount,

      // Width/height ratio of each child
      childAspectRatio: aspectRation,

      children: List.generate(models.length, (index) {
        // Check is an even Row
        if (isEvenRow(index)) {
          // Large one
          if (isEven(index)) {
            return NoteCardLarge(
              model: models[index],
            );
          }

          // Small
          return NoteCardSmall(
            model: models[index],
          );

          // Odd Row
        } else {
          // Small
          if (isEven(index)) {
            return NoteCardSmall(
              model: models[index],
            );
          }

          // Large
          return NoteCardLarge(
            model: models[index],
          );
        }
      }),
    );
  }
}
