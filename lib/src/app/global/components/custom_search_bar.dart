import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/global/bloc/notes_bloc.dart';
import 'package:notes/utils/consts.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: MaterialStateProperty.all(1),

      backgroundColor: MaterialStateProperty.all(
        white.withOpacity(
          0.7,
        ),
      ),

      hintText: "Seach",
      hintStyle: MaterialStateProperty.all(
        Theme.of(context).textTheme.bodyMedium,
      ),

      // Action
      onChanged: (value) =>
          BlocProvider.of<NotesBloc>(context).add(SearchNote(search: value)),
    );
  }
}
