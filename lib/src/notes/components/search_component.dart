import 'package:flutter/material.dart';

class SearchComponent extends StatelessWidget {
  final Size size;
  const SearchComponent({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    // Getting screen Size
    final double height = size.height;
    final double width = size.width;

    return Container(
      // Size
      height: height * .1,
      width: width,

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      decoration: BoxDecoration(
        // Colors
        color: Colors.transparent.withOpacity(
          0.1,
        ),

        // Shape
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          // Search Text
          Text(
            "Search",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          Icon(
            Icons.search,
          ),
        ],
      ),
    );
  }
}
