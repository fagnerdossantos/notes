import 'package:flutter/material.dart'
    show BuildContext, Icon, IconButton, Icons, State, StatefulWidget, Widget;
import 'package:provider/provider.dart' show ReadContext;

import '../../../core/utils/colors.dart';
import '../../../domain/bloc/notes_bloc.dart';
import '../../../domain/models/note_model.dart';

class FavoriteButton extends StatefulWidget {
  final NoteModel model;
  const FavoriteButton({super.key, required this.model});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = widget.model.favorite;
    super.initState();
  }

  changeSelection() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Bloc controller
    final bloc = context.read<NotesBloc>();

    return IconButton(
      // Action
      onPressed: () {
        changeSelection();
        widget.model.favorite = isFavorite;
        bloc.add(
          NoteSetFavorite(
            model: widget.model,
          ),
        );
      },

      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? DefaultColors.red : DefaultColors.black,
        size: 25,
      ),

      tooltip: "Delete",
    );
  }
}
