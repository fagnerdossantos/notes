import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 8,

      onPressed: () => Navigator.pushNamed(context, "/create"),
      // Icon
      child: const Icon(Icons.add),
    );
  }
}
