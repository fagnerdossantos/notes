import 'package:flutter/material.dart';
import 'package:notes/utils/size.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const VerticalSpace(height: 100),

        // image
        const Image(
          image: AssetImage(
            "assets/images/no-data.png",
          ),
          fit: BoxFit.cover,
        ),

        Text(
          "There are no notes!\nClick the button to create a new one.",
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
