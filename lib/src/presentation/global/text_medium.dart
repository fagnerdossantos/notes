import 'package:flutter/material.dart';

class TextMedium extends StatelessWidget {
  final String text;
  const TextMedium({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}
