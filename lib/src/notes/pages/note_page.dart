import 'package:flutter/material.dart';
import 'package:notes/src/notes/components/add_note_sheet_component.dart';
import 'package:notes/src/notes/components/notes_field.dart';
import 'package:notes/src/notes/models/notes_model.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final model = ModalRoute.of(context)!.settings.arguments as NotesModel;

    // Screen Size
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          // Box Size
          height: double.infinity,
          width: double.infinity,

          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              // Column Alignment
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                // IconButton(
                //     onPressed: () => Navigator.pop(context),
                //     icon: Icon(Icons.arrow_back)),
                // Note Title
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Note
                Text(
                  model.notes,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Time
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Date
                    Column(
                      children: [
                        const Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        //
                        const SizedBox(
                          height: 2,
                        ),

                        Text(
                          model.date,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // Hour
                    Column(
                      children: [
                        const Text(
                          "Hour",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        //
                        const SizedBox(
                          height: 2,
                        ),

                        Text(
                          model.hour,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Action
        onPressed: () {
          // Setting controllers value to edit
          noteTitleController.text = model.title;
          noteController.text = model.notes;

          // Calling the bottom sheet
          addNoteSheetComponents(
            context: context,
            size: size,
            action: BtnAction.edit,
            originalModel: model,
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
