import 'package:flutter/material.dart';

class TextLarge extends StatelessWidget {
  final String text;
  const TextLarge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}
