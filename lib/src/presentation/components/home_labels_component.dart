import 'package:flutter/material.dart';

class HomeLabels extends StatelessWidget {
  final String label;
  const HomeLabels({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}