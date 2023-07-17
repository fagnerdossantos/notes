import 'package:flutter/widgets.dart'
    show BuildContext, ColoredBox, StatelessWidget, Widget;

import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

import '../../core/utils/colors.dart';
import '../../domain/bloc/notes_bloc.dart';
import '../components/notes/card_grid.dart';

class NoteStateViewmodel extends StatelessWidget {
  const NoteStateViewmodel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (_, state) {
        return switch (state) {
          // Load all Notes
          LoadedState(models: final models) => CardGrid(models: models),

          // Filtered by user
          FilteredState(models: final models) => CardGrid(models: models),

          // No Data State
          NoDataState() => const ColoredBox(color: DefaultColors.black),
          _ => const ColoredBox(color: DefaultColors.black),
        };
      },
    );
  }
}
