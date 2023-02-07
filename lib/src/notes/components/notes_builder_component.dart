import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/bloc/notes_bloc.dart';
import 'package:notes/src/global/no_data_image.dart';
import 'package:notes/src/notes/components/notes_card.dart';
import 'package:notes/src/notes/models/notes_model.dart';

class NotesBuilderComponent extends StatelessWidget {
  const NotesBuilderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // Bloc Builder
    return BlocBuilder<NotesBloc, NotesState>(builder: ((_, state) {
      // No Data
      if (state.notesList.isEmpty) {
        return const NoDataImage();

        // Data
      } else {
        return GridView.builder(
          // Delegate
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: .7,
          ),

          // Count
          itemCount: state.notesList.length,

          // Builder
          itemBuilder: ((_, index) {
            NotesModel model = state.notesList[index];

            return GestureDetector(
              // Action
              onTap: () =>
                  Navigator.pushNamed(context, "/note", arguments: model),

              // Content
              child: NotesCard(
                index: index,
                model: model,
              ),
            );
          }),
        );
      }
    }));
  }
}
