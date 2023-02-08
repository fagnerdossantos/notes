import 'package:flutter/material.dart';
import 'package:notes/src/notes/components/notes_field.dart';
import 'package:notes/src/presentation/global/button_builder.dart';
import 'package:notes/src/presentation/global/text_large.dart';
import 'package:notes/src/presentation/global/text_medium.dart';
import 'package:notes/utils/consts.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting Screen Size
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;

    return Scaffold(
      // App bar
      appBar: AppBar(
        title: const TextLarge(text: "Edite Note"),
        centerTitle: true,
      ),

      // App body
      body: Padding(
        padding: defaultPadding,
        child: Column(
          // Column Alignment
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Title Field
            const TextMedium(
              text: "Title",
            ),

            verticalSpace(
              height: height * .01,
            ),

            NotesField(size: size, id: 1),
            verticalSpace(
              height: height * .05,
            ),

            // Note field
            const TextMedium(
              text: "Note",
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

            // Button
            const ButtonBuilder(action: BtnActions.save),
          ],
        ),
      ),
    );
  }
}
