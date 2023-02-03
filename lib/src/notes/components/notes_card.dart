import 'package:flutter/material.dart';
import 'package:notes/src/database/notes_db.dart';
import 'package:notes/src/global/popu_menu.dart';
import 'package:provider/provider.dart';

class NotesCard extends StatelessWidget {
  final int index;
  const NotesCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<Database>();
    final note = controller.notesList[index];

    return Card(
      // Card Shape
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      elevation: 3.0,

      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: PopUpMenu(
              index: index,
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
                    note.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                // Note Expanded
                Expanded(
                  flex: 11,
                  child: Text(
                    note.notes,
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
                        note.date,
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
