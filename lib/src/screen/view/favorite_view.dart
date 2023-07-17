import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget;

import '../../core/utils/types.dart';
import '../../domain/bloc/notes_bloc.dart';
import '../../domain/models/screen_template.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    // Setting current view key
    currentView = ViewKey.favorite;

    return ScreenTemplate(
      event: GetFavoriteEvent(),
      title: "Favorites",
    );
  }
}
