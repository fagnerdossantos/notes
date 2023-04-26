import 'package:flutter/material.dart';
import 'package:notes/utils/consts.dart';

class SaveNoteButton extends StatelessWidget {
  final Function() callBack;
  const SaveNoteButton({
    super.key,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // Action
      onPressed: callBack,

      backgroundColor: black,
      child: const Icon(Icons.save_alt_outlined),
    );
  }
}
