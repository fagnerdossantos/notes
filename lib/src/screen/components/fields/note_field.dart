import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        FloatingLabelBehavior,
        FocusScope,
        InputDecoration,
        OutlineInputBorder,
        Radius,
        StatelessWidget,
        Text,
        TextEditingController,
        TextFormField,
        Theme,
        Widget;

class NoteField extends StatelessWidget {
  final String label;
  final bool isTitle;
  final TextEditingController controller;
  const NoteField({
    super.key,
    required this.label,
    required this.isTitle,
    required this.controller,
  });

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
          ? Theme.of(context).textTheme.bodyLarge
          : Theme.of(context).textTheme.bodySmall,

      // Lines
      maxLines: isTitle ? 1 : 10,

      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },

      controller: controller,
    );
  }
}
