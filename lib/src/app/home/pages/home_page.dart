import 'package:flutter/material.dart';

import '../../global/components/custom_app_bar.dart';
import '../../global/components/custom_bottom_sheet.dart';
import '../../global/components/custom_drawer.dart';
import '../../global/components/custom_floating_actions_button.dart';
import '../../global/components/custom_search_bar.dart';
import '../../note/widgets/custom_notes_card_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(label: "Notes"),

      //
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search
              SizedBox(
                // Sizing
                height: 100,
                width: size.width,

                child: const Center(child: CustomSearchBar()),
              ),

              const Expanded(child: NotesCardBuilder()),
            ],
          ),
        ),
      ),

      // Drawer
      drawer: Drawer(
        child: CustomDrawer(
          size: size,
        ),
      ),

      floatingActionButton: CustomFloatingActionButton(
        callBack: () {
          customBottomSheet(context: context, size: size);
        },
        icon: Icons.add,
      ),
    );
  }
}
