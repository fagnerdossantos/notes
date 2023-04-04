import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/global/bloc/notes_bloc.dart';
import 'package:notes/src/app/global/components/action_menu.dart';
import 'package:notes/src/app/note/components/save_note_button.dart';
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

    return Scaffold(
      // Bar
      appBar: AppBar(
        actions: [
          ActionsMenu(context: context, id: model.id!),
        ],
        elevation: 0,
      ),

      // Note Content
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Title
          CupertinoTextField(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                1,
              ),
            ),
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
            controller: titleController,
          ),

          // Note
          CupertinoTextField(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                1,
              ),
            ),
            maxLines: 10,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
            controller: noteController,
          ),

          // DATE AND HOUR
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (String item in [
                "Creation",
                model.date,
                "${model.hour}h",
              ])
                Text(
                  item,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            ],
          ),
        ],
      ),

      // Save
      floatingActionButton: SaveNoteButton(
        callBack: () {
          // Time
          final List<String> time = TimeClass().call();

          // New model
          final newmodel = NoteModel(
            id: model.id,
            title: titleController.text,
            note: noteController.text,
            date: time[0],
            hour: time[1],
          );

          BlocProvider.of<NotesBloc>(context).add(UpdateNote(model: newmodel));
          Navigator.pop(context);
        },
      ),
    );
  }
}
