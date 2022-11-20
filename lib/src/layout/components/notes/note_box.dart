import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes/src/utils/consts.dart';

class NoteBox extends StatelessWidget {
  const NoteBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // Blur Filter
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          // Styling to get the glass effect
          decoration: BoxDecoration(
            // Colors
            color: white.withOpacity(0.3),

            // Gradient
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white12,
              ],
            ),

            // Shape
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
      ),
    );
  }
}
