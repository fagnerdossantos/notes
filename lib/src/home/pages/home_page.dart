import 'package:flutter/material.dart';
import 'package:notes/src/home/components/home_labels_component.dart';
import 'package:notes/src/notes/components/add_note_sheet_component.dart';
import 'package:notes/src/notes/components/notes_builder_component.dart';
import 'package:notes/src/notes/components/search_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double height = size.height;

    return Scaffold(
      // App Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 15,
          ),

          // Content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcoming label
              const HomeLabels(label: "Welcome, back!"),

              verticalSpace(
                height: height * .05,
              ),

              SearchComponent(
                size: size,
              ),

              verticalSpace(
                height: height * .05,
              ),

              const HomeLabels(
                label: "My notes",
              ),

              verticalSpace(height: height * .01),

              const Expanded(
                child: NotesBuilderComponent(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Action
        onPressed: () => addNoteSheetComponents(
          context: context,
          size: size,
        ),

        // Color
        backgroundColor: Colors.black,

        // Icon
        child: const Icon(Icons.add),
      ),
    );
  }
}

SizedBox verticalSpace({double height = 20}) => SizedBox(
      height: height,
    );
