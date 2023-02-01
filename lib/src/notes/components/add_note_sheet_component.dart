import 'package:flutter/material.dart';
import 'package:notes/src/home/pages/home_page.dart';
import 'package:notes/src/notes/components/add_button_component.dart';
import 'package:notes/src/notes/components/notes_field.dart';

Future addNoteSheetComponents(
        {required BuildContext context, required Size size}) =>
    showModalBottomSheet(
      // Allow to use total screen size
      isScrollControlled: true,

      context: context,

      builder: ((_) {
        // Getting Screen Size
        final double height = size.height;
        final double width = size.width;

        return SizedBox(
          // Size
          height: height * .8,
          width: width,

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              // Column Alignment
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // ADD Text
                const Text(
                  "Add note",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                verticalSpace(
                  height: height * .05,
                ),

                // Title
                const Text(
                  "Title",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                verticalSpace(
                  height: height * .01,
                ),

                NotesField(size: size, id: 1),

                verticalSpace(
                  height: height * .05,
                ),

                // Note
                const Text(
                  "Note",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
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

                // Add Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    AddButtonComponent(),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
