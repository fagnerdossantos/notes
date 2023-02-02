import 'package:flutter/material.dart';
import 'package:notes/src/global/theme_switch.dart';
import 'package:notes/src/home/components/home_labels_component.dart';
import 'package:notes/src/notes/components/add_note_sheet_component.dart';
import 'package:notes/src/notes/components/notes_builder_component.dart';
import 'package:notes/src/notes/components/search_component.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen Size
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;

    // Theme Controller
    final controller = context.watch<ThemeSwitch>();

    return Scaffold(
      // App Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 9,
          ),

          // Content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcoming label and Theme Switch
              Row(
                // Alignment
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Label
                  const HomeLabels(label: "Welcome, back!"),

                  // Theme Switch
                  Switch(
                    value: controller.isDark,
                    onChanged: (_) => controller.toggle(),
                  ),
                ],
              ),

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

        // Icon
        child: const Icon(Icons.add),
      ),
    );
  }
}

SizedBox verticalSpace({double height = 20}) => SizedBox(
      height: height,
    );
