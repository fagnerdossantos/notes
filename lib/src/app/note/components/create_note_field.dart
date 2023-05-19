import 'package:flutter/material.dart';

class CreateNoteField extends StatelessWidget {
  final Size size;
  final String label;
  final bool isTitle;
  final TextEditingController controller;
  const CreateNoteField(
      {super.key,
      required this.label,
      required this.size,
      required this.isTitle,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Styling
      decoration: InputDecoration(
        // Shape
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),

        // Label
        label: Text(label),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),

      // Text Style
      style: isTitle
          ? Theme.of(context).textTheme.displayMedium
          : Theme.of(context).textTheme.bodyLarge,

      // Lines
      maxLines: isTitle ? 1 : 10,

      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },

      controller: controller,
    );
  }
}
