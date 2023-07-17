import 'package:flutter/material.dart'
    show
        BuildContext,
        MainAxisAlignment,
        Row,
        StatelessWidget,
        Text,
        Theme,
        Widget;

class FormattedTime extends StatelessWidget {
  final DateTime time;
  const FormattedTime({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (String item in [
          "${time.day} - ${time.month} - ${time.year}",
          "${time.hour}:${time.minute}",
        ])
          Text(
            item,
            style: Theme.of(context).textTheme.bodySmall,
          ),
      ],
    );
  }
}
