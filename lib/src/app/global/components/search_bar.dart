import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/global/bloc/notes_bloc.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _isSearchBarVisible = false;

  void _toggleSearchBar() {
    setState(() {
      _isSearchBarVisible = !_isSearchBarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icons Button
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: _toggleSearchBar,
          iconSize: 35,
        ),

        // Search Field
        AnimatedContainer(
          // Animation settings
          duration: const Duration(milliseconds: 300),
          width: _isSearchBarVisible ? 250 : 0,

          child: TextField(
            onChanged: (value) => BlocProvider.of<NotesBloc>(context)
                .add(SearchNote(search: value)),

            // Styling
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodySmall,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
