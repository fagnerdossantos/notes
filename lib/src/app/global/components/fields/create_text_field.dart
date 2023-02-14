import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final noteTitleController = TextEditingController();
final noteController = TextEditingController();

class CreateTextField extends StatelessWidget {
  final Size size;
  final int id;

  const CreateTextField({super.key, required this.size, required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Elevation
      elevation: 8,

      child: CupertinoTextField(
        // Remove Field borders
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
        ),

        maxLength: (id == 1) ? 13 : 1000,
        maxLines: (id != 1) ? 10 : 1,
        style: (id == 1)
            ? Theme.of(context).textTheme.bodySmall
            : Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
        controller: (id == 1) ? noteTitleController : noteController,
      ),
    );
  }
}
