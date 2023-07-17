import 'package:flutter/material.dart'
    show
        Border,
        BoxDecoration,
        BoxShape,
        BuildContext,
        Color,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        InkWell,
        MainAxisAlignment,
        Row,
        State,
        StatefulWidget,
        Widget;

import '../../../core/utils/utils.dart';

int colorController = 0;

class ColorButton extends StatefulWidget {
  const ColorButton({super.key});

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        Row(
          // Align
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (int i = 0; i < _colors.length; i++) ...[
              // Rounded color button
              InkWell(
                // Action
                onTap: () => setState(() => colorController = i),

                child: Container(
                  // Sizing
                  height: 40,
                  width: 40,

                  decoration: BoxDecoration(
                    color: _colors[i],

                    // Shaping
                    border: Border.all(
                      color: DefaultColors.black,
                      width: 2,
                    ),

                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Spacing
              const HorizontalSpacing(value: Spacing.small),
            ],
          ],
        ),

        //
        const VerticalSpacing(value: Spacing.small),

        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 5,
          width: 50,
          color: _colors[colorController],
        ),
      ],
    );
  }
}

//
List<Color> _colors = [
  DefaultColors.white,
  DefaultColors.amber,
  DefaultColors.purple,
  DefaultColors.red,
  DefaultColors.blue
];
