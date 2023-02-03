import 'package:flutter/material.dart';
import 'package:notes/src/database/notes_db.dart';
import 'package:notes/src/notes/components/notes_field.dart';
import 'package:notes/src/notes/models/notes_model.dart';
import 'package:provider/provider.dart';

class AddButtonComponent extends StatelessWidget {
  const AddButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final connection = context.read<Database>();

    return OutlinedButton(
      // Action
      onPressed: () {
        connection.generateId();
        final id = connection.id;
        final title = noteTitleController.text;
        final notes = noteController.text;

        final time = connection.getDate();

        final model = NotesModel(
          id: id,
          title: title,
          notes: notes,
          date: time[0],
          hour: time[1],
        );

        // Saving
        connection.create(model);

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
          const Icon(Icons.add),
        ],
      ),
    );
  }
}
