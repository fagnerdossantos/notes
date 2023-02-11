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
    return CupertinoTextField(
      maxLength: (id == 1) ? 13 : 1000,
      maxLines: (id != 1) ? 10 : 1,
      style: (id == 1)
          ? Theme.of(context).textTheme.displaySmall
          : Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
      controller: (id == 1) ? noteTitleController : noteController,
    );
  }
}
