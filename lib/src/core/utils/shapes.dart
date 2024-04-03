import 'package:flutter/material.dart' show BorderRadius;

enum RoundedShape {
  small,
  medium,
  large;

  BorderRadius get shape => switch (this) {
        RoundedShape.small => BorderRadius.circular(10),
        RoundedShape.medium => BorderRadius.circular(30),
        RoundedShape.large => BorderRadius.circular(50),
      };
}
