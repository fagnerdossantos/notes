import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/logic/blocs/notes_bloc.dart';
import 'package:notes/src/presentation/models/notes_model.dart';

class PopUpMenu extends StatelessWidget {
  final NotesModel model;
  const PopUpMenu({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // Bloc Controller
    final controller = BlocProvider.of<NotesBloc>(context);

    return PopupMenuButton(
      onSelected: (value) => {
        value == 2 ? controller.add(RemoveNoteEvent(note: model)) : false,
      },

      // Builder
      itemBuilder: (_) => [
        // Favorite button
        const PopupMenuItem(
          value: 1,
          child: Icon(
            Icons.favorite,
          ),
        ),

        // Delete button
        const PopupMenuItem(
          value: 2,
          child: Icon(
            Icons.delete,
          ),
        ),
      ],
    );
  }
}
