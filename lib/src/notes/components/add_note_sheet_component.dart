import 'package:flutter/material.dart';
import 'package:notes/src/home/pages/home_page.dart';
import 'package:notes/src/global/add_button_component.dart';
import 'package:notes/src/notes/components/notes_field.dart';
import 'package:notes/src/global/update_button_component.dart';
import 'package:notes/src/notes/models/notes_model.dart';

enum BtnAction {
  add,
  edit;
}

Future addNoteSheetComponents({
  required BuildContext context,
  required Size size,
  required BtnAction action,
  required NotesModel? originalModel,
}) =>
    showModalBottomSheet(
      // Allow to use total screen size
      isScrollControlled: true,

      context: context,

      builder: ((_) {
        // Getting Screen Size
        final double height = size.height;
        final double width = size.width;

        return ListView(
          children: [
            SizedBox(
              // Size
              height: height * .8,
              width: width,

              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  // Column Alignment
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // ADD Text
                    Text(
                      "Add note",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),

                    verticalSpace(
                      height: height * .05,
                    ),

                    // Title
                    Text(
                      "Title",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),

                    verticalSpace(
                      height: height * .01,
                    ),

                    NotesField(size: size, id: 1),

                    verticalSpace(
                      height: height * .05,
                    ),

                    // Note
                    Text(
                      "Note",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),

                    verticalSpace(
                      height: height * .01,
                    ),

                    NotesField(
                      size: size,
                      id: 2,
                    ),

                    verticalSpace(
                      height: height * .05,
                    ),

                    // Add and Update Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        action == BtnAction.add
                            ? const AddButtonComponent()
                            : EditButtonComponent(
                                original: originalModel!,
                              ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
