import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  final int index;
  const NotesCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card sColor
      color: Colors.blue,

      // Card Shape
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      elevation: 3.0,

      child: Center(
        child: Text(
          index.toString(),
        ),
      ),
    );
  }
}
