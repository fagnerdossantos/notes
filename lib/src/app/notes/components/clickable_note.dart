import 'package:flutter/material.dart';
import 'package:notes/src/app/global/components/fields/edit_field.dart';
import 'package:notes/src/app/notes/components/notes_card.dart';
import 'package:notes/src/app/notes/models/notes_model.dart';

class ClickableNote extends StatelessWidget {
  final BuildContext context;
  final int index;
  final NotesModel model;
  const ClickableNote(
      {super.key,
      required this.context,
      required this.index,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Handle the current note navigation
      onTap: () {
        // To set values inside edit controllers
        titleEditController.text = model.title;
        noteEditController.text = model.notes;

        Navigator.pushNamed(context, "/note", arguments: model);
      },

      // Content
      child: NotesCard(
        index: index,
        model: model,
      ),
    );
  }
}
