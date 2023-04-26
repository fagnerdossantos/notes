import 'package:flutter/material.dart';
import 'package:notes/utils/consts.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          // image
          const Image(
            image: AssetImage(
              "assets/images/no-data.png",
            ),
            fit: BoxFit.cover,
          ),

          const VerticalSpace(height: 100),

          Text(
            "There are no notes!\nClick the button to create a new one.",
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
