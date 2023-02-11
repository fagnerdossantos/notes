import 'package:flutter/material.dart';
import 'package:notes/src/presentation/components/create_button.dart';
import 'package:notes/src/presentation/components/save_button.dart';
import 'package:notes/src/presentation/components/edit_button.dart';
import 'package:notes/src/presentation/models/notes_model.dart';
import 'package:notes/utils/consts.dart';

class ButtonBuilder extends StatelessWidget {
  final BtnActions action;
  final NotesModel? originalModel;
  const ButtonBuilder({super.key, required this.action, this.originalModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      // Button Alignment
      mainAxisAlignment: MainAxisAlignment.end,

      children: [
        // Create
        action == BtnActions.create
            ? const CreateButton()

            // Save
            : (action == BtnActions.save
                ? SaveButton(
                    originalModel: originalModel,
                  )

                // Update
                : const EditButton()),
      ],
    );
  }
}
