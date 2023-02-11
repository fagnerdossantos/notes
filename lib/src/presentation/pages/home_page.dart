import 'package:flutter/material.dart';
import 'package:notes/src/presentation/global/button_builder.dart';
import 'package:notes/src/presentation/themes/theme_switch.dart';
import 'package:notes/src/presentation/components/home_labels_component.dart';
import 'package:notes/src/presentation/widgets/notes_builder.dart';
import 'package:notes/src/presentation/components/search_notes.dart';
import 'package:notes/utils/consts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen Size
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    // Theme Controller
    final controller = context.watch<ThemeSwitch>();

    return Scaffold(
      // App Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),

          // Content
          child: Column(
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

              SearchNotes(
                size: size,
              ),

              verticalSpace(
                height: height * .03,
              ),

              Divider(
                height: 0,
                indent: width * .1,
                endIndent: width * .1,
                thickness: 1,
                color: Colors.blueGrey.withOpacity(0.3),
              ),

              verticalSpace(
                height: height * .02,
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
      floatingActionButton: const ButtonBuilder(action: BtnActions.create),
    );
  }
}
