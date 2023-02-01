import 'package:flutter/material.dart';

class NotesField extends StatelessWidget {
  final Size size;
  final int id;

  const NotesField({super.key, required this.size, required this.id});

  @override
  Widget build(BuildContext context) {
    final double height = size.height;
    final double width = size.width;

    return Container(
      // Size
      height: (id == 1) ? height * .1 : height * .3,
      width: width,

      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),

      decoration: BoxDecoration(
        // Shape
        borderRadius: BorderRadius.circular(20),

        // Border
        border: Border.all(color: Colors.black, width: 2),
      ),

      child: TextField(
        maxLines: (id == 1) ? 1 : 15,
        maxLength: (id == 1) ? 15 : 400,
      ),
    );
  }
}
