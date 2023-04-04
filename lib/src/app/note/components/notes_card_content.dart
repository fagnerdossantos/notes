import 'package:flutter/material.dart';
import 'package:notes/src/app/note/models/note_model.dart';

class NotesCardContent extends StatelessWidget {
  final double width;
  final NoteModel model;
  const NotesCardContent({super.key, required this.width, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        CustomExpandedText(
          flex: 2,
          text: model.title,
          style: Theme.of(context).textTheme.titleSmall!,
        ),

        // Note
        CustomExpandedText(
          flex: 14,
          text: model.note,
          style: Theme.of(context).textTheme.bodyMedium!,
        ),
      ],
    );
  }
}

class CustomExpandedText extends StatelessWidget {
  final int flex;
  final String text;
  final TextStyle style;
  const CustomExpandedText(
      {super.key, required this.flex, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return // Note
        Expanded(
      flex: flex,
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
