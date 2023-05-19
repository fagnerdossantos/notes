import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/global/bloc/notes_bloc.dart';
import 'package:notes/src/app/note/models/note_model.dart';
import 'package:notes/src/database/time_class.dart';

class CreateNoteButton extends StatelessWidget {
  final TextEditingController title, note;
  const CreateNoteButton({
    super.key,
    required this.title,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    // Bloc Contoler
    final bloc = context.read<NotesBloc>();

    return ElevatedButton(
      // Action
      onPressed: () {
        // Generating id and time
        final List<String> time = TimeClass().call();

        // Adding to bloc
        bloc.add(
          CreateNote(
            model: NoteModel(
              title: title.text,
              note: note.text,
              date: time[0],
              hour: time[1],
            ),
          ),
        );

        // Cleaning controllers
        title.clear();
        note.clear();

        Navigator.pop(context);
      },

      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.save_alt_outlined),
          SizedBox(
            width: 10,
          ),
          Text("SAVE"),
        ],
      ),
    );
  }
}
