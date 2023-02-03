import 'package:flutter/material.dart';

final noteTitleController = TextEditingController();
final noteController = TextEditingController();

class NotesField extends StatelessWidget {
  final Size size;
  final int id;

  const NotesField({super.key, required this.size, required this.id});

  @override
  Widget build(BuildContext context) {
    final double height = size.height;
    final double width = size.width;

    return Card(
      // elevation
      elevation: 2,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Container(
        // Size
        height: (id == 1) ? height * .1 : height * .25,
        width: width,

        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),

        child: TextField(
          maxLength: (id == 1) ? 15 : null,
          controller: (id == 1) ? noteTitleController : noteController,
        ),
      ),
    );
  }
}
