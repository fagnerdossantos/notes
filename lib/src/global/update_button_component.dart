import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/bloc/notes_bloc.dart';
import 'package:notes/src/database/id_time.dart';
import 'package:notes/src/notes/components/notes_field.dart';
import 'package:notes/src/notes/models/notes_model.dart';

class EditButtonComponent extends StatelessWidget {
  final NotesModel original;
  const EditButtonComponent({super.key, required this.original});

  @override
  Widget build(BuildContext context) {
    // Bloc
    final notesBlocController = BlocProvider.of<NotesBloc>(context);

    final IdTime idTime = IdTime();

    return OutlinedButton(
      // Action
      onPressed: () {
        final title = noteTitleController.text;
        final notes = noteController.text;

        idTime.generateTime();
        List<String> time = idTime.time;

        final model = NotesModel(
          id: original.id,
          title: title,
          notes: notes,
          date: time[0],
          hour: time[1],
        );

        // Saving
        notesBlocController.add(
          UpdateNoteEvent(
            previusNote: original,
            newNote: model,
          ),
        );

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
