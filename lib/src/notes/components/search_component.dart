import 'package:flutter/material.dart';

class SearchComponent extends StatelessWidget {
  final Size size;
  const SearchComponent({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    // Getting screen Size
    final double height = size.height;
    final double width = size.width;

    return Card(
      // Card Shape
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),

      // Elevation
      elevation: 3,

      child: Container(
        // Size
        height: height * .1,
        width: width,

        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Search Text
            Text(
              "Search",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const Icon(
              Icons.search,
            ),
          ],
        ),
      ),
    );
  }
}
