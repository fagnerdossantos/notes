import 'package:flutter/material.dart'
    show BuildContext, Row, StatelessWidget, Widget;

import '../../../domain/models/note_model.dart';
import '../buttons/delete_button.dart';
import '../buttons/favorite_button.dart';

class ActionsMenu extends StatelessWidget {
  final BuildContext context;
  final NoteModel model;
  const ActionsMenu({
    super.key,
    required this.context,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Delete
        DeleteButton(
          id: model.id!,
        ),

        // Favorite
        FavoriteButton(
          model: model,
        )
      ],
    );
  }
}
