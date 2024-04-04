import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        EdgeInsets,
        Expanded,
        Padding,
        Scaffold,
        State,
        StatefulWidget,
        Widget;

import 'package:provider/provider.dart' show ReadContext;

import '../../core/utils/utils.dart';
import '../../screen/components/fields/custom_search_bar.dart';
import '../../screen/components/global/custom_app_bar.dart';
import '../../screen/components/global/custom_drawer.dart';
import '../../screen/viewmodel/note_state_viewmodel.dart';
import '../bloc/notes_bloc.dart';

ViewKey currentView = ViewKey.home;

class ScreenTemplate extends StatefulWidget {
  final NotesEvent event;
  final String title;
  final Widget? fabButton;

  const ScreenTemplate({
    super.key,
    required this.title,
    this.fabButton,
    required this.event,
  });

  @override
  State<ScreenTemplate> createState() => _ScreenTemplateState();
}

class _ScreenTemplateState extends State<ScreenTemplate> {
  // Used to init bloc state ex: Load or Favorite event;
  @override
  void initState() {
    context.read<NotesBloc>().add(widget.event);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    const dfPadding = EdgeInsets.symmetric(horizontal: 8.0);

    return Scaffold(
      // Bg Colors
      backgroundColor: DefaultColors.white.withOpacity(.9),
      // App Bar
      appBar: CustomAppBar(
        title: widget.title,
      ),

      // Give the Scroll
      body: Padding(
        padding: dfPadding,
        child: Column(
          children: [
            SpaceVertical.small.add,

            // Search notes
            const CustomSearchBar(),

            SpaceVertical.medium.add,

            // Notes builder
            const Expanded(child: NoteStateViewmodel()),
          ],
        ),
      ),

      drawer: const CustomDrawer(),

      floatingActionButton: widget.fabButton,
    );
  }
}
