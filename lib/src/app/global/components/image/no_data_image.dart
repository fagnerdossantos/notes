import 'package:flutter/material.dart';

class NoDataImage extends StatelessWidget {
  const NoDataImage({super.key});

  @override
  Widget build(BuildContext context) {
    const String blueImg = "assets/images/no-data-blue.png";

    return const Image(
      image: AssetImage(
        blueImg,
      ),
    );
  }
}
