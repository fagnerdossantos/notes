import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/global/bloc/notes_bloc.dart';

class ActionsMenu extends StatelessWidget {
  final BuildContext context;
  final int id;
  const ActionsMenu({super.key, required this.context, required this.id});

  @override
  Widget build(BuildContext context) {
    // Bloc controller
    final bloc = BlocProvider.of<NotesBloc>(context);

    return Row(
      children: [
        // Delete
        IconButton(
          // Action
          onPressed: () {
            bloc.add(DeleteNote(id: id));

            Navigator.pop(context);
          },

          tooltip: "Delete",

          icon: const Icon(
            Icons.delete_outline,
          ),
        ),

        // Favorite
        IconButton(
          // Action
          onPressed: () {},

          tooltip: "Favorite",

          icon: const Icon(
            Icons.favorite_outline,
          ),
        ),
      ],
    );
  }
}
