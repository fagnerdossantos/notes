import 'package:flutter/cupertino.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        CupertinoTextField,
        StatelessWidget,
        TextAlign,
        TextEditingController,
        TextStyle,
        Widget;

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final TextStyle style;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.maxLines,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      // ! Used to remove all borders
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          1,
        ),
      ),

      maxLines: maxLines,

      style: style,
      textAlign: TextAlign.center,

      controller: controller,
    );
  }
}
