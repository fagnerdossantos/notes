import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/logic/blocs/notes_bloc.dart';
import 'package:notes/src/database/id_time.dart';
import 'package:notes/src/presentation/components/create_text_field.dart';
import 'package:notes/src/presentation/models/notes_model.dart';
import 'package:notes/src/presentation/components/edit_field.dart';

class SaveButton extends StatelessWidget {
  final NotesModel? originalModel;
  const SaveButton({super.key, this.originalModel});

  @override
  Widget build(BuildContext context) {
    // Bloc
    final notesBloc = BlocProvider.of<NotesBloc>(context);

    return OutlinedButton(
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
