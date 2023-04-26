import 'package:flutter/material.dart';
import 'package:notes/utils/consts.dart';

class SelectedItemDrawer extends StatefulWidget {
  const SelectedItemDrawer({Key? key}) : super(key: key);

  @override
  State<SelectedItemDrawer> createState() => _SelectedItemDrawerState();
}

class _SelectedItemDrawerState extends State<SelectedItemDrawer> {
  int _selectedIndex = 0;

  final List<String> labels = [
    "All Notes",
    "Favorites",
    "Trash",
  ];

  final List<IconData> icons = [
    Icons.all_inbox_outlined,
    Icons.favorite_outline,
    Icons.delete_outline
  ];

  void _selectIndex(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: labels.length,
      itemBuilder: (context, index) {
        final isSelected = index == _selectedIndex;
        return InkWell(
          // Action
          onTap: () {
            _selectIndex(index);
          },

          // Content
          child: AnimatedContainer(
            // Alignment
            padding: const EdgeInsets.all(16),

            duration: const Duration(milliseconds: 500),

            decoration: BoxDecoration(
              color: (isSelected ? amber : white),
              borderRadius: BorderRadius.circular(30),
            ),

            child: Row(
              children: [
                // Icon
                Icon(
                  icons[index],
                  size: 30,
                  color: black,
                ),

                const SizedBox(
                  width: 10,
                ),

                // Label text
                Text(
                  labels[index],
                  style: (isSelected)
                      ? Theme.of(context).textTheme.bodyMedium
                      : Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
