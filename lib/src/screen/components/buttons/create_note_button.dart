import 'package:flutter/material.dart'
    show
        BuildContext,
        ButtonStyle,
        Color,
        ElevatedButton,
        Icon,
        Icons,
        MainAxisAlignment,
        MaterialStateProperty,
        Navigator,
        Row,
        StatelessWidget,
        Text,
        TextEditingController,
        TextStyle,
        Widget;

import 'package:provider/provider.dart' show ReadContext;

import '../../../core/utils/utils.dart';
import '../../../domain/bloc/notes_bloc.dart';
import '../../../domain/models/note_model.dart';
import '../../view/create_note_view.dart';
import 'color_button.dart';

class CreateNoteButton extends StatelessWidget {
  final TextEditingController title, note;
  const CreateNoteButton({
    super.key,
    required this.title,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    // Bloc Controller
    final bloc = context.read<NotesBloc>();

    return ElevatedButton(
      // Color
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(DefaultColors.black),
      ),

      // Action
      onPressed: () {
        // Adding to bloc
        bloc.add(
          NoteCreate(
            model: NoteModel(
              title: titleController.text,
              note: noteController.text,
              color: colorController,
              favorite: false,
              time: DateTime.now(),
            ),
          ),
        );

        // Cleaning controllers
        title.clear();
        note.clear();

        colorController = 0;

        Navigator.pop(context);
      },

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.save_alt_outlined),
          SpaceHorizontal.small.add,
          const Text(
            "save",
            style: TextStyle(
              color: DefaultColors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
