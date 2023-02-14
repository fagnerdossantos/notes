import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TitleText extends StatelessWidget {
  final String label;
  final Widget? widgetFunc;
  const TitleText({super.key, required this.label, this.widgetFunc});

  @override
  Widget build(BuildContext context) {
    return Row(
      // Alignment
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        GradientText(
          label,

          // Styling
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),

          // Gradient Colors
          colors: const [
            Colors.blueAccent,
            Colors.blueGrey,
          ],
        ),
        widgetFunc ?? const SizedBox(),
      ],
    );
  }
}
