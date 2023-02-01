import 'package:flutter/material.dart';

class AddButtonComponent extends StatelessWidget {
  const AddButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // Action
      onPressed: () {},

      style: ButtonStyle(
        // BG Color
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ),

        // Shape
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
      ),

      // Label
      child: Row(
        children: const [
          Text("Add note"),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.add),
        ],
      ),
    );
  }
}
