import 'package:flutter/material.dart';

class CreateNoteField extends StatelessWidget {
  final Size size;
  final String label;
  final bool isTitle;
  final TextEditingController controller;
  const CreateNoteField(
      {super.key,
      required this.label,
      required this.size,
      required this.isTitle,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            // Title
            SizedBox(
              width: size.width * .9,
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            // Field
            SizedBox(
              width: size.width * .9,
              child: Card(
                // Sizing inside
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),

                  // Content
                  child: TextFormField(
                    maxLines: isTitle ? 1 : 10,
                    // Text Style
                    style: isTitle
                        ? Theme.of(context).textTheme.titleLarge
                        : Theme.of(context).textTheme.titleSmall,

                    controller: controller,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
