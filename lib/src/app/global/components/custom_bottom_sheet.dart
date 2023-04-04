import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/global/bloc/notes_bloc.dart';
import 'package:notes/src/app/note/components/create_note_field.dart';
import 'package:notes/src/app/note/models/note_model.dart';
import 'package:notes/src/database/time_class.dart';

TextEditingController titleController = TextEditingController();
TextEditingController noteController = TextEditingController();

void customBottomSheet({required BuildContext context, required Size size}) {
  // Bloc Contoler
  final bloc = BlocProvider.of<NotesBloc>(context);

  // Calling Bottom sheet

  showModalBottomSheet(
    // Size
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height,
    ),

    context: context,
    useSafeArea: true,
    isScrollControlled: true,

    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: ListView(
          children: [
            // Title
            CreateNoteField(
              size: size,
              label: "Title",
              isTitle: true,
              controller: titleController,
            ),

            SizedBox(
              height: size.height * .05,
            ),

            // Note
            CreateNoteField(
              size: size,
              label: "Note",
              isTitle: false,
              controller: noteController,
            ),

            SizedBox(
              height: size.height * .1,
            ),

            // Save
            ElevatedButton(
              onPressed: () {
                // Generating id and time
                final List<String> time = TimeClass().call();

                final String title = titleController.text;
                final String note = noteController.text;

                // Adding to bloc
                bloc.add(
                  CreateNote(
                    model: NoteModel(
                      title: title,
                      note: note,
                      date: time[0],
                      hour: time[1],
                    ),
                  ),
                );

                // Cleaning controllers
                titleController.clear();
                noteController.clear();

                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.save_alt_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text("SAVE"),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
