import 'package:flutter/material.dart';
import 'package:notes/src/database/notes_db.dart';
import 'package:notes/src/notes/components/notes_field.dart';
import 'package:notes/src/notes/models/notes_model.dart';
import 'package:provider/provider.dart';

class EditButtonComponent extends StatelessWidget {
  final NotesModel original;
  const EditButtonComponent({super.key, required this.original});

  @override
  Widget build(BuildContext context) {
    final connection = context.read<Database>();

    return OutlinedButton(
      // Action
      onPressed: () {
        final title = noteTitleController.text;
        final notes = noteController.text;

        final time = connection.getDate();

        final model = NotesModel(
          id: original.id,
          title: title,
          notes: notes,
          date: time[0],
          hour: time[1],
        );

        // Saving
        connection.update(original, model);

        noteTitleController.clear();
        noteController.clear();

        Navigator.pop(context);
      },

      // Label
      child: Row(
        children: [
          // Button text
          Text(
            "Add note",
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          const SizedBox(
            width: 5,
          ),

          // Button Icon
          const Icon(Icons.save),
        ],
      ),
    );
  }
}
