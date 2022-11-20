import 'package:flutter/material.dart';

import 'package:notes/src/utils/consts.dart';

class NotesVoid extends StatelessWidget {
  const NotesVoid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Bg Image
        const Image(
          image: AssetImage("assets/images/add_notes.png"),
        ),

        Text(
          "Vazio",
          style: textStyle(
            color: white,
            size: 28,
          ),
        ),

        Text(
          "Você ainda não tem notas",
          style: textStyle(
            color: grey,
            size: 20,
          ),
        ),

        // Add Notes button
        ElevatedButton(
          onPressed: () {},
          // Styling
          style: ButtonStyle(
            // Color
            backgroundColor: MaterialStateProperty.all<Color>(grey),

            // Shape
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          child: Text(
            "Criar Nota",
            style: textStyle(
              color: white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
