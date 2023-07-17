import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

import '../../domain/bloc/navigation_bloc.dart';
import '../view/favorite_view.dart';
import '../view/home_view.dart';
import '../view/note_view.dart';
// show BuildContext, SizedBox, StatelessWidget, Widget;

// import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

class NavigationViewModel extends StatelessWidget {
  const NavigationViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(builder: (_, state) {
      return switch (state) {
        NavigationInitial() || HomeState() => const HomeView(),
        FavoriteState() => const FavoriteView(),
        NoteState(model: final model) => NoteView(
            model: model,
          ),
      };
    });
  }
}
