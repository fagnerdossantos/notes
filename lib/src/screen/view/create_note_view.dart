import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxConstraints,
        BuildContext,
        Column,
        EdgeInsets,
        MainAxisAlignment,
        MediaQuery,
        Padding,
        PopScope,
        Radius,
        RoundedRectangleBorder,
        TextEditingController,
        showModalBottomSheet;

import '../../core/utils/spacing.dart';
import '../components/buttons/color_button.dart';
import '../components/buttons/create_note_button.dart';
import '../components/fields/note_field.dart';

var titleController = TextEditingController();
var noteController = TextEditingController();

void createNoteView({required BuildContext context}) {
  // Calling Bottom sheet
  showModalBottomSheet(
    // Size
    constraints: BoxConstraints(
      minHeight: MediaQuery.sizeOf(context).height,
    ),

    context: context,
    useSafeArea: true,
    isScrollControlled: true,

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),

    builder: (context) {
      // Clear controller if user click back button
      return PopScope(
        onPopInvoked: (pop) async {
          titleController.clear();
          noteController.clear();
          return;
        },

        // Content
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),

          //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Fields
              for (Map item in [
                {
                  "Label": "Title",
                  "IsTitle": true,
                  "controller": titleController
                },
                {
                  "Label": "Note",
                  "IsTitle": false,
                  "controller": noteController
                },
              ]) ...[
                NoteField(
                  label: item["Label"],
                  isTitle: item["IsTitle"],
                  controller: item["controller"],
                ),

                //
                SpaceVertical.medium.add,
              ],

              // Color button picker
              const ColorButton(),

              SpaceVertical.medium.add,

              // Save
              CreateNoteButton(
                title: titleController,
                note: noteController,
              ),
            ],
          ),
        ),
      );
    },
  );
}
