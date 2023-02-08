import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/logic/blocs/notes_bloc.dart';
import 'package:notes/src/database/id_time.dart';
import 'package:notes/src/notes/components/notes_field.dart';
import 'package:notes/src/notes/models/notes_model.dart';

class SaveButton extends StatelessWidget {
  final NotesModel? originalNote;
  const SaveButton({super.key, this.originalNote});

  @override
  Widget build(BuildContext context) {
    // Bloc
    final notesBloc = BlocProvider.of<NotesBloc>(context);

    final IdTime idTime = IdTime();

    return OutlinedButton(
      // Action
      onPressed: () {
        if (originalNote == null) {
          _create(notesBloc, idTime);
        } else {
          _update(notesBloc, idTime, originalNote!);
        }

        noteTitleController.clear();
        noteController.clear();

        Navigator.pop(context);
      },

      // Label
      child: Row(
        children: [
          // Button text
          Text(
            "Save",
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          const SizedBox(
            width: 5,
          ),

          // Button Icon
          const Icon(Icons.save_alt_outlined),
        ],
      ),
    );
  }
}

_create(NotesBloc notesBloc, IdTime idTime) {
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
}

_update(NotesBloc notesBloc, IdTime idTime, NotesModel originalNote) {
  final int id = originalNote.id;
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
  notesBloc.add(UpdateNoteEvent(
    previusNote: originalNote,
    newNote: model,
  ));
}
