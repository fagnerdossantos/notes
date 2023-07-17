import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        PreferredSizeWidget,
        Size,
        SizedBox,
        StatelessWidget,
        Text,
        Theme,
        Widget,
        kToolbarHeight;

import 'package:notes/src/core/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? actions;
  final Widget? leading;
  const CustomAppBar({super.key, this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // BAR Title
      title: Text(
        title ?? "",
        style: Theme.of(context).textTheme.titleLarge,
      ),

      // BAR Actions
      actions: [actions ?? const SizedBox()],

      leading: leading,

      // BAR BG Color
      backgroundColor: DefaultColors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
