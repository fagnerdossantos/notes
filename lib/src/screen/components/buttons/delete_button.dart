import 'package:flutter/material.dart'
    show BuildContext, Icon, IconButton, Icons, StatelessWidget, Widget;

import 'package:provider/provider.dart' show ReadContext;

import '../../../core/utils/colors.dart';
import '../../../domain/bloc/navigation_bloc.dart';
import '../../../domain/bloc/notes_bloc.dart';

class DeleteButton extends StatelessWidget {
  final int id;
  const DeleteButton({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // Blocs
    final blocNotes = context.read<NotesBloc>();
    final blocNav = context.read<NavigationBloc>();

    return IconButton(
      // Action
      onPressed: () {
        blocNotes.add(DeleteEvent(id: id));
        blocNav.add(GoBackTo()); // Context Handled inside Navigation bloc
      },

      tooltip: "Delete",

      icon: const Icon(
        Icons.delete_outline,
        color: DefaultColors.black,
        size: 25,
      ),
    );
  }
}
