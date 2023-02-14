import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/notes/blocs/notes_bloc.dart';
import 'package:notes/src/database/id_time.dart';
import 'package:notes/src/app/global/components/fields/create_text_field.dart';
import 'package:notes/src/app/notes/models/notes_model.dart';
import 'package:notes/src/app/global/components/fields/edit_field.dart';

class SaveButton extends StatelessWidget {
  final NotesModel? originalModel;
  const SaveButton({super.key, this.originalModel});

  @override
  Widget build(BuildContext context) {
    // Bloc
    final notesBloc = BlocProvider.of<NotesBloc>(context);

    return FloatingActionButton(
      // Action
      onPressed: () {
        if (originalModel == null) {
          _create(notesBloc);
        } else {
          _update(notesBloc, originalModel!);
        }

        noteTitleController.clear();
        noteController.clear();

        Navigator.pop(context);
      },

      // Elevation
      elevation: 8,

      child: const Icon(Icons.save_alt_outlined),
    );
  }
}

_create(NotesBloc notesBloc) {
  //
  final IdTime idTime = IdTime();

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

_update(NotesBloc notesBloc, NotesModel originalModel) {
  //
  final IdTime idTime = IdTime();

  idTime.generateId();
  idTime.generateTime();

  final int id = originalModel.id;
  final List<String> time = idTime.time;

  final String title = titleEditController.text;
  final String notes = noteEditController.text;

  final model = NotesModel(
    id: id,
    title: title,
    notes: notes,
    date: time[0],
    hour: time[1],
  );

  // Saving
  notesBloc.add(UpdateNoteEvent(
    previusNote: originalModel,
    newNote: model,
  ));

  titleEditController.clear();
  noteEditController.clear();
}
