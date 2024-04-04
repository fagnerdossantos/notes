import 'package:flutter/material.dart'
    show
        BuildContext,
        Icon,
        Icons,
        MaterialStatePropertyAll,
        RoundedRectangleBorder,
        SearchBar,
        StatelessWidget,
        Theme,
        Widget;
import 'package:notes/src/domain/bloc/notes_bloc.dart';
import 'package:provider/provider.dart' show ReadContext;

import '../../../core/utils/shapes.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Bloc
    final bloc = context.read<NotesBloc>();

    return SearchBar(
      // Styling
      elevation: const MaterialStatePropertyAll(3),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: RoundedShape.small.shape),
      ),

      leading: const Icon(
        Icons.search,
      ),

      hintText: "search",
      hintStyle: MaterialStatePropertyAll(
        Theme.of(context).textTheme.bodySmall,
      ),

      // Action
      onChanged: (value) => bloc.add(NoteFilter(search: value)),
    );
  }
}
