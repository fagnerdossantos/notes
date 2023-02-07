import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/bloc/notes_bloc.dart';
import 'package:notes/src/database/id_time.dart';
import 'package:notes/src/notes/components/notes_field.dart';
import 'package:notes/src/notes/models/notes_model.dart';

class AddButtonComponent extends StatelessWidget {
  const AddButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // Bloc
    final notesBloc = BlocProvider.of<NotesBloc>(context);

    final IdTime idTime = IdTime();

    return OutlinedButton(
      // Action
      onPressed: () {
        //
        idTime.generateId();
        idTime.generateTime();

        final int id = idTime.id;
        final List<String> time = idTime.time;

        final String title = noteTitleController.text;
        final String notes = noteController.text;

        final model = NotesModel(
          id: id,
          title: title,
          notes: notes,
          date: time[0],
          hour: time[1],
        );

        // Saving
        notesBloc.add(AddNoteEvent(note: model));

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
