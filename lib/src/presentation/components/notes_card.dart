// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:notes/src/presentation/components/popu_menu.dart';
import 'package:notes/src/presentation/models/notes_model.dart';
import 'package:notes/src/presentation/widgets/rounded_card_widget.dart';

class NotesCard extends StatelessWidget {
  final int index;
  final NotesModel model;

  const NotesCard({
    Key? key,
    required this.index,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedCardWidget(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: PopUpMenu(
              model: model,
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 8.0,
            ),

            //
            child: Column(
              children: [
                // Title Expanded
                Expanded(
                  flex: 3,
                  child: Text(
                    model.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                // Note Expanded
                Expanded(
                  flex: 11,
                  child: Text(
                    model.notes,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),

                // Time Expanded
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Date
                      Text(
                        model.date,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
