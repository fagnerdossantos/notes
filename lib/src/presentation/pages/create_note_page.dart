import 'package:flutter/material.dart';
import 'package:notes/src/presentation/components/create_text_field.dart';
import 'package:notes/src/presentation/global/button_builder.dart';
import 'package:notes/src/presentation/global/text_large.dart';
import 'package:notes/src/presentation/global/text_medium.dart';
import 'package:notes/utils/consts.dart';

class CreateNotePage extends StatelessWidget {
  const CreateNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting Screen Size
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;

    return Scaffold(
      // App bar
      appBar: AppBar(
        title: const TextLarge(text: "Create Note"),
        centerTitle: true,
      ),

      body: Padding(
        padding: defaultPadding,

        child: ListView(
          children: [
            verticalSpace(
              height: height * .05,
            ),

            // Title Field
            const TextMedium(
              text: "Title",
            ),

            verticalSpace(
              height: height * .01,
            ),

            CreateTextField(size: size, id: 1),
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

            CreateTextField(
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
