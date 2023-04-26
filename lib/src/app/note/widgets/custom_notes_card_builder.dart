import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/global/bloc/notes_bloc.dart';
import 'package:notes/src/app/note/components/empty_notes.dart';
import 'package:notes/src/app/note/components/notes_card_grid.dart';

class NotesCardBuilder extends StatefulWidget {
  const NotesCardBuilder({super.key});

  @override
  State<NotesCardBuilder> createState() => _NotesCardBuilderState();
}

class _NotesCardBuilderState extends State<NotesCardBuilder> {
  // Controller
  late final NotesBloc blocController;

  @override
  void didChangeDependencies() {
    blocController = BlocProvider.of<NotesBloc>(context);
    blocController.add(LoadNotes());

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccess || state is NotesFiltered) {
          return NotesCardGrid(
            items: state.models,
          );
        } else {
          return const EmptyNotes();
        }
      },
    );
  }
}
