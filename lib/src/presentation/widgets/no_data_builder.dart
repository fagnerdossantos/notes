import 'package:flutter/material.dart';
import 'package:notes/src/presentation/components/no_data_image.dart';
import 'package:notes/src/presentation/global/text_medium.dart';

class NoDataBuilder extends StatelessWidget {
  const NoDataBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        NoDataImage(),
        TextMedium(
          text: "You are able to create a note by clicking the '+' icon",
        ),
      ],
    );
  }
}
