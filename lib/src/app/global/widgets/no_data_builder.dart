import 'package:flutter/material.dart';
import 'package:notes/src/app/global/components/image/no_data_image.dart';

class NoDataBuilder extends StatelessWidget {
  const NoDataBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        NoDataImage(),
        Text(
          "You are able to create a note by clicking the '+' icon",

          // Styling
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),

          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
