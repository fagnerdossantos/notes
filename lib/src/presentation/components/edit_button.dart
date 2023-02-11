import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, "/edit"),
      // Icon
      child: const Icon(Icons.edit),
    );
  }
}
