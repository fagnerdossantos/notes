import 'package:flutter/material.dart';
import 'package:notes/src/presentation/models/notes_model.dart';
import 'package:notes/src/presentation/components/edit_field.dart';
import 'package:notes/src/presentation/components/time_row.dart';
import 'package:notes/src/presentation/global/button_builder.dart';
import 'package:notes/src/presentation/global/text_large.dart';
import 'package:notes/utils/consts.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final model = ModalRoute.of(context)!.settings.arguments as NotesModel;

    // Screen Size
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;

    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const TextLarge(text: "Note"),
        centerTitle: true,
      ),

      body: Padding(
        padding: defaultPadding,
        child: ListView(
          children: [
            verticalSpace(
              height: height * .05,
            ),

            const EditField(id: 1),

            verticalSpace(
              height: height * .02,
            ),

            const EditField(id: 2),

            verticalSpace(
              height: height * .02,
            ),

            // Time
            TimeRow(
              time: [model.date, model.hour],
            ),
          ],
        ),
      ),
      floatingActionButton: ButtonBuilder(
        action: BtnActions.save,
        originalModel: model,
      ),
    );
  }
}
