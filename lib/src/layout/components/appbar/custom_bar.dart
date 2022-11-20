import 'package:flutter/material.dart';

import 'package:notes/src/utils/consts.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Notes APP",
          style: textStyle(
            color: white.withOpacity(0.8),
            customFamily: true,
            size: 35,
          ),
        ),
        Icon(
          Icons.search_rounded,
          color: grey,
          size: 40,
        ),
      ],
    );
  }
}
