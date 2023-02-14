import 'package:flutter/material.dart';
import 'package:notes/src/app/global/components/text/sutitle_text.dart';
import 'package:notes/src/app/global/components/text/title_text.dart';
import 'package:notes/src/app/global/widgets/button_builder.dart';
import 'package:notes/src/app/notes/widgets/notes_builder.dart';
import 'package:notes/src/app/notes/components/search_notes.dart';
import 'package:notes/src/themes/theme_switch.dart';
import 'package:notes/utils/consts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen Size
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;

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
              const TitleText(
                label: "Welcome, back!",
                widgetFunc: ThemeSwitch(),
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

              const SubtitleText(
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
