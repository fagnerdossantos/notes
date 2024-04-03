import 'package:flutter/material.dart'
    show
        BuildContext,
        Card,
        Column,
        Container,
        EdgeInsets,
        Expanded,
        InkWell,
        LayoutBuilder,
        MainAxisAlignment,
        StatelessWidget,
        Text,
        TextAlign,
        Theme,
        Widget;
import 'package:provider/provider.dart' show ReadContext;

import '../../../core/utils/spacing.dart';
import '../../../domain/bloc/navigation_bloc.dart';
import '../../../domain/helpers/colors_helper.dart';
import '../../../domain/models/note_model.dart';

class NoteCardSmall extends StatelessWidget {
  final NoteModel model;
  const NoteCardSmall({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // Navigation
    final nav = context.read<NavigationBloc>();

    return LayoutBuilder(
      builder: (_, constraints) {
        // Container Size
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;

        const double hightFactor = .8; // 80 %
        const double widthFactor = .95; // 95 %

        return InkWell(
          // Action
          onTap: () => nav.add(GoToNote(model: model)),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                color: ColorsHelper.intToColor(idColor: model.color),
                child: Container(
                  // Sizing
                  height: height * hightFactor,
                  width: width * widthFactor,

                  padding: const EdgeInsets.all(10),

                  child: Column(
                    children: [
                      // Title
                      Expanded(
                        flex: 2,
                        child: Text(
                          model.title,
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SpaceVertical.small.add,

                      // Text
                      Expanded(
                        flex: 13,
                        child: Text(
                          model.note,
                          style: Theme.of(context).textTheme.bodySmall,
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
