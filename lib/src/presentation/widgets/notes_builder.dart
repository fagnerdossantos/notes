import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/logic/blocs/notes_bloc.dart';
import 'package:notes/src/presentation/components/notes_card.dart';
import 'package:notes/src/presentation/models/notes_model.dart';
import 'package:notes/src/presentation/components/edit_field.dart';
import 'package:notes/src/presentation/widgets/no_data_builder.dart';

class NotesBuilderComponent extends StatelessWidget {
  const NotesBuilderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    // Bloc Builder
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (_, state) {
        // No Data
        if (state.notesList.isEmpty) {
          return ListView.builder(itemBuilder: (_,__)=> const NoDataBuilder());

          // Data
        } else {
          final int length = state.notesList.length;

          return GridView.builder(
            gridDelegate: delegate,

            itemCount: length,

            //
            itemBuilder: (_, index) {
              NotesModel model = state.notesList[index];

              return GestureDetector(
                // Action
                onTap: () {
                  // To set values inside edit controllers
                  titleEditController.text = model.title;
                  noteEditController.text = model.notes;

                  Navigator.pushNamed(context, "/note", arguments: model);
                },
                // Content
                child: NotesCard(
                  index: index,
                  model: model,
                ),
              );
            },
          );
        }
      },
    );
  }
}

const delegate = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  crossAxisSpacing: 10,
  mainAxisSpacing: 20,
  childAspectRatio: .7,
);
