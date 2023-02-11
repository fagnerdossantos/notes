import 'package:flutter/material.dart';

class TimeRow extends StatelessWidget {
  final List<String> time;
  const TimeRow({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (String item in time)
          Text(
            item,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
