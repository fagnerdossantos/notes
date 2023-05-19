import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? label;
  final Widget? actions;
  const CustomAppBar({super.key, this.label, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,

      //
      title: Text(
        label ?? "",
        style: Theme.of(context).textTheme.displayLarge,
      ),

      actions: [actions ?? const SizedBox()],

      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
