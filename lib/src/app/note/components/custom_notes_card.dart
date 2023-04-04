import 'package:flutter/material.dart';
import 'package:notes/src/app/note/components/notes_card_content.dart';
import 'package:notes/src/app/note/models/note_model.dart';

class CustomNotesCard extends StatelessWidget {
  final bool isLarge;
  final NoteModel model;
  const CustomNotesCard({
    super.key,
    required this.isLarge,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        // Container Size
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;

        void action() =>
            Navigator.pushNamed(context, "/note", arguments: model);

        return GestureDetector(
          // Action
          onTap: action,

          child: Column(
            // Column Alignment
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              // Add A Menu
              Card(
                child: Container(
                  // Card Size
                  height: isLarge ? (height / 1.1) : (height / 1.4),
                  width: width * .95,

                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),

                  child: NotesCardContent(
                    width: width,
                    model: model,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
