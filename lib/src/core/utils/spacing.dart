import 'package:flutter/material.dart'
    show BuildContext, SizedBox, StatelessWidget, Widget;

// DEFAULT SPACING
enum Spacing {
  small(value: 10),
  medium(value: 30),
  large(value: 50);

  final double value;
  const Spacing({required this.value});
}

class VerticalSpacing extends StatelessWidget {
  final Spacing value;
  const VerticalSpacing({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value.value,
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  final Spacing value;

  const HorizontalSpacing({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value.value,
    );
  }
}
