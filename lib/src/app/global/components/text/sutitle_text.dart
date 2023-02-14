import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String label;
  final Widget? widgetFunc;
  const SubtitleText({super.key, required this.label, this.widgetFunc});

  @override
  Widget build(BuildContext context) {
    return Row(
      // Alignment
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        widgetFunc ?? const SizedBox(),
      ],
    );
  }
}
