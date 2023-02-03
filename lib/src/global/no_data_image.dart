import 'package:flutter/material.dart';
import 'package:notes/src/global/theme_switch.dart';
import 'package:provider/provider.dart';

class NoDataImage extends StatelessWidget {
  const NoDataImage({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme Controller
    final controller = context.watch<ThemeSwitch>();

    const String pinkImg = "assets/images/no-data-pink.png";
    const String blueImg = "assets/images/no-data-blue.png";

    return Column(
      children: [
        // IMG
        controller.isDark
            ? const Image(
                image: AssetImage(
                  blueImg,
                ),
              )
            : const Image(
                image: AssetImage(
                  pinkImg,
                ),
              ),

        //
        Text(
          "You are able to create a note by clicking the '+' icon",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
