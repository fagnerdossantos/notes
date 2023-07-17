import 'package:flutter/material.dart'
    show BuildContext, Icons, StatelessWidget, Widget;

import '../../core/utils/types.dart';
import '../../domain/bloc/notes_bloc.dart';
import '../../domain/models/screen_template.dart';
import '../components/buttons/custom_fab_button.dart';
import 'create_note_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Setting current view key
    currentView = ViewKey.home;

    return ScreenTemplate(
      event: LoadEvent(),
      title: "Notes",
      fabButton: CustomFabButton(
        callback: () => createNoteView(context: context),
        icon: Icons.add,
      ),
    );
  }
}
