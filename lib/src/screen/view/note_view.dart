import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        Icons,
        Scaffold,
        SingleChildScrollView,
        StatelessWidget,
        TextEditingController,
        Theme,
        Widget;

import 'package:provider/provider.dart' show ReadContext;

import '../../core/utils/spacing.dart';
import '../../domain/bloc/navigation_bloc.dart';
import '../../domain/bloc/notes_bloc.dart';
import '../../domain/models/note_model.dart';
import '../components/buttons/color_button.dart';
import '../components/buttons/custom_back_button.dart';
import '../components/buttons/custom_fab_button.dart';
import '../components/fields/custom_text_field.dart';
import '../components/global/custom_app_bar.dart';
import '../components/menus/actions_menu.dart';
import '../components/notes/formatted_time.dart';

class NoteView extends StatelessWidget {
  final NoteModel model;
  const NoteView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // Controllers
    var titleController = TextEditingController(text: model.title);
    var noteController = TextEditingController(text: model.note);

    // Setting color to check changes after
    colorController = model.color;

    final List<Map> fieldItems = [
      {
        "controller": titleController,
        "maxLines": 1,
        "style": Theme.of(context).textTheme.titleLarge
      },
      {
        "controller": noteController,
        "maxLines": 10,
        "style": Theme.of(context).textTheme.bodySmall
      },
    ];

    return Scaffold(
      //App bar
      appBar: CustomAppBar(
        leading: const CustomBackButton(),
        actions: ActionsMenu(
          context: context,
          model: model,
        ),
      ),

      // Note Content
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            SpaceVertical.medium.add,

            for (var map in fieldItems) ...[
              // Field
              CustomTextField(
                  controller: map["controller"],
                  maxLines: map["maxLines"],
                  style: map["style"]),

              // Spacing
              SpaceVertical.large.add,
            ],

            // DATE AND HOUR
            FormattedTime(time: model.time),

            SpaceVertical.large.add,

            const ColorButton(),
          ],
        ),
      ),

      // Save
      floatingActionButton: CustomFabButton(
        // Icon
        icon: Icons.save_alt_outlined,

        // Action
        callback: () {
          // New model
          final newModel = NoteModel(
            id: model.id,
            title: titleController.text,
            note: noteController.text,
            color: colorController,
            favorite: model.favorite,
            time: DateTime.now(),
          );

          context.read<NotesBloc>().add(
                UpdateEvent(
                  model: newModel,
                ),
              );

          // Reset Color controller
          colorController = 0;

          // Navigator
          context.read<NavigationBloc>().add(GoBackTo());
        },
      ),
    );
  }
}
