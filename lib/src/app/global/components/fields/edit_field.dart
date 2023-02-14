import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final titleEditController = TextEditingController();
final noteEditController = TextEditingController();

class EditField extends StatelessWidget {
  final int id;
  const EditField({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      // Remove borders
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),

      maxLength: (id == 1) ? 13 : 1000,
      maxLines: (id != 1) ? 10 : 1,
      style: (id == 1)
          ? Theme.of(context).textTheme.titleSmall
          : Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
      controller: (id == 1) ? titleEditController : noteEditController,
    );
  }
}
