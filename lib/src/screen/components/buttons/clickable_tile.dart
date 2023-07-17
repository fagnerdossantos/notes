import 'package:flutter/material.dart'
    show
        AnimatedContainer,
        BoxDecoration,
        BuildContext,
        EdgeInsets,
        Icon,
        IconData,
        InkWell,
        Key,
        MainAxisAlignment,
        Padding,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        TextAlign,
        Theme,
        Widget;
import 'package:provider/provider.dart' show ReadContext, WatchContext;

import '../../../core/utils/utils.dart';
import '../../../domain/bloc/navigation_bloc.dart';
import '../../../providers/selected_item_drawer_provider.dart';

class ClickableTile extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  const ClickableTile({
    Key? key,
    required this.index,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controllers
    final controller = context.watch<SelectedItemDrawer>();
    bool isSelected = controller.currentIndex == index;

    // Navigation bloc
    final bloc = context.read<NavigationBloc>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        // Action
        onTap: () {
          final int currentIndex = controller.currentIndex;

          if (currentIndex != index) {
            controller.changeSelectedIndex(index);
          }

          (currentIndex == 0) ? bloc.add(GoToFavorite()) : bloc.add(GoToHome());
        },

        child: AnimatedContainer(
          // Sizing
          height: 50,

          padding: const EdgeInsets.all(5),

          // Styling
          decoration: BoxDecoration(
            color: isSelected ? DefaultColors.amber : DefaultColors.white,

            // Shape
            borderRadius: RoundedShape.small,
          ),

          duration: const Duration(milliseconds: 500),

          child: Row(
            // Alignment
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              // Icon
              Icon(
                icon,
                size: 25,
                color: isSelected ? DefaultColors.purple : DefaultColors.black,
              ),

              // Label
              Text(
                label,
                style: isSelected
                    ? Theme.of(context).textTheme.bodyLarge
                    : Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),

              // Counter
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
