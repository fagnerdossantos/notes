import 'package:flutter/material.dart';

class HomeLabels extends StatelessWidget {
  final String label;
  const HomeLabels({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
