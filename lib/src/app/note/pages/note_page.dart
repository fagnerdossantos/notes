import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/global/bloc/notes_bloc.dart';
import 'package:notes/src/app/global/components/action_menu.dart';
import 'package:notes/src/app/global/components/custom_app_bar.dart';
import 'package:notes/src/app/global/components/custom_floating_actions_button.dart';
import 'package:notes/src/app/global/components/custom_text_field.dart';
import 'package:notes/src/app/note/models/note_model.dart';
import 'package:notes/src/database/time_class.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers
    var titleController = TextEditingController();
    var noteController = TextEditingController();

    // Getting the args from context
    final model = ModalRoute.of(context)!.settings.arguments as NoteModel;

    titleController.text = model.title;
    noteController.text = model.note;

    final List<Map> fieldItems = [
      {
        "Controller": titleController,
        "MaxLines": 1,
        "Style": Theme.of(context).textTheme.displayLarge
      },
      {
        "Controller": noteController,
        "MaxLines": 10,
        "Style": Theme.of(context).textTheme.bodyLarge
      },
    ];

    final timeStatus = [
      "Creation",
      model.date,
      "${model.hour}h",
    ];

    return Scaffold(
      // Bar
      appBar: CustomAppBar(
        actions: ActionsMenu(context: context, id: model.id!),
      ),

      // Note Content
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Fields

          ...fieldItems
              .map(
                (element) => CustomTextField(
                    controller: element["Controller"],
                    maxLines: element["MaxLines"],
                    style: element["Style"]),
              )
              .toList(),

          // DATE AND HOUR
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: timeStatus
                .map((element) => Text(
                      element,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ))
                .toList(),
          ),
        ],
      ),

      // Save
      floatingActionButton: CustomFloatingActionButton(
        callBack: () {
          // Time
          final List<String> time = TimeClass().call();

          // New model
          final newModel = NoteModel(
            id: model.id,
            title: titleController.text,
            note: noteController.text,
            date: time[0],
            hour: time[1],
          );

          context.read<NotesBloc>().add(UpdateNote(model: newModel));
          Navigator.pop(context);
        },
        icon: Icons.save_alt_outlined,
      ),
    );
  }
}
