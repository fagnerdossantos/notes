import 'package:flutter/material.dart' show SizedBox, Widget;

// DEFAULT SPACING
enum SpaceVertical {
  small,
  medium,
  large;

  Widget get add => SizedBox(
        height: switch (this) {
          SpaceVertical.small => 10,
          SpaceVertical.medium => 30,
          SpaceVertical.large => 50,
        },
      );
}

enum SpaceHorizontal {
  small,
  medium,
  large;

  Widget get add => SizedBox(
        width: switch (this) {
          SpaceHorizontal.small => 10,
          SpaceHorizontal.medium => 30,
          SpaceHorizontal.large => 50,
        },
      );
}
