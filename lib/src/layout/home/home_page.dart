import 'package:flutter/material.dart';

import 'package:notes/src/layout/components/appbar/custom_bar.dart';
import 'package:notes/src/layout/components/buttons/floating_add_notes.dart';
import 'package:notes/src/layout/components/labels/home_label.dart';
import 'package:notes/src/layout/components/notes/notes_builder.dart';
import 'package:notes/src/utils/consts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the Screen size
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    // Local
    List<String> label = ["Todos", "Favoritos"];

    return Scaffold(
      backgroundColor: deepBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const CustomBar(),

              const SizedBox(
                height: 50,
              ),

              // All and Favorite
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (String item in label)
                    HomeLabel(
                      label: item,
                      isActive: false,
                      action: () {},
                    ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              // Notes Builder
              const Expanded(
                child: NotesBuilder(),
              ),
            ],
          ),
        ),
      ),

      // Floating Button
      floatingActionButton: const FloatingAddNotes(),
    );
  }
}
