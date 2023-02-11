import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/logic/blocs/notes_bloc.dart';

class SearchNotes extends StatelessWidget {
  final Size size;
  const SearchNotes({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    // Bloc controller
    final controller = BlocProvider.of<NotesBloc>(context);

    return Card(
      // Card Shape
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),

      // Elevation
      elevation: 1,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        child: TextField(
          // Label
          decoration: const InputDecoration(
            label: Text(
              "Search",
            ),
          ),

          // Action
          onChanged: (value) => controller.add(SearchNoteEvent(search: value)),
        ),
      ),
    );
  }
}
