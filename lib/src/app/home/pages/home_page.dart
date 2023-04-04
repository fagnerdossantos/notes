import 'package:flutter/material.dart';
import 'package:notes/src/app/global/components/custom_bottom_sheet.dart';
import 'package:notes/src/app/global/components/custom_drawer.dart';
import 'package:notes/src/app/global/components/search_bar.dart';
import 'package:notes/src/app/note/widgets/custom_notes_card_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: CustomScrollView(
          slivers: [
            // AppBar
            SliverAppBar.medium(
              title: Center(
                // Title
                child: Text(
                  "Notes",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              actions: const [
                SearchBar(),
              ],
            ),

            // Notes
            const NotesCardBuilder(),
          ],
        ),
      ),

      // Drawer
      drawer: Drawer(
        child: CustomDrawer(
          size: size,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          customBottomSheet(context: context, size: size);
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
