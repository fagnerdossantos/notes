import 'package:flutter/material.dart';

class RoundedCardWidget extends StatelessWidget {
  final Widget child;
  const RoundedCardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Rounded Shape
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      elevation: 3.0,

      child: child,
    );
  }
}
