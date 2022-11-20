import 'package:flutter/material.dart';

import 'package:notes/src/utils/consts.dart';

class FloatingAddNotes extends StatelessWidget {
  const FloatingAddNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // Action
      onPressed: () {},

      backgroundColor: blue,

      // Image
      child: const Image(
        image: AssetImage(
          "assets/icons/plus.png",
        ),
      ),
    );
  }
}
