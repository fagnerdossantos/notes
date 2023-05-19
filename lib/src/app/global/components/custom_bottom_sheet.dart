import 'package:flutter/material.dart';
import 'package:notes/src/app/note/components/create_note_field.dart';
import 'package:notes/src/app/note/components/create_note_button.dart';
import 'package:notes/utils/consts.dart';

TextEditingController titleController = TextEditingController();
TextEditingController noteController = TextEditingController();

void customBottomSheet({required BuildContext context, required Size size}) {
  // Calling Bottom sheet

  showModalBottomSheet(
    // Size
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height,
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
      return WillPopScope(
        onWillPop: () async {
          titleController.clear();
          noteController.clear();
          return true;
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
                {"Size": size, "Label": "Title", "IsTitle": true},
                {"Size": size, "Label": "Note", "IsTitle": false},
              ]) ...[
                CreateNoteField(
                  label: item["Label"],
                  size: item["Size"],
                  isTitle: item["IsTitle"],
                  controller:
                      item["IsTitle"] ? titleController : noteController,
                ),

                //
                VerticalSpace(height: size.height * .07),
              ],

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
