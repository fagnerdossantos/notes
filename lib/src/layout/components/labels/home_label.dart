import 'package:flutter/material.dart';

import 'package:notes/src/utils/consts.dart';

class HomeLabel extends StatelessWidget {
  final String label;
  final bool isActive;
  final Function action;
  const HomeLabel(
      {super.key,
      required this.label,
      required this.isActive,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: textStyle(
        color: grey,
        size: 22,
      ),
    );
  }
}
