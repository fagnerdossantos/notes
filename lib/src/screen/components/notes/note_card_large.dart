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
        StatelessWidget,
        Text,
        TextAlign,
        Theme,
        Widget;
import 'package:provider/provider.dart' show ReadContext;

import '../../../core/utils/utils.dart';
import '../../../domain/bloc/navigation_bloc.dart';
import '../../../domain/helpers/colors_helper.dart';
import '../../../domain/models/note_model.dart';

class NoteCardLarge extends StatelessWidget {
  final NoteModel model;
  const NoteCardLarge({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // Navigation
    final nav = context.read<NavigationBloc>();

    return LayoutBuilder(
      builder: (_, constraints) {
        // Container Size
        final double height = constraints.maxHeight;
        final double width = constraints.maxWidth;

        const double widthFactor = .95; // 95 %

        return InkWell(
          // Action
          onTap: () => nav.add(GoToNote(model: model)),

          child: Card(
            color: ColorsHelper.intToColor(idColor: model.color),
            child: Container(
              // Sizing
              height: height,
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

                  const VerticalSpacing(value: Spacing.small),

                  // Text
                  Expanded(
                    flex: 16,
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
        );
      },
    );
  }
}
