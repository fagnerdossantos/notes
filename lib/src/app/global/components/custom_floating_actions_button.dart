import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function() callBack;
  final IconData icon;
  const CustomFloatingActionButton({
    super.key,
    required this.callBack,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // Action
      onPressed: callBack,

      backgroundColor:
          Theme.of(context).floatingActionButtonTheme.backgroundColor,
      child: Icon(icon),
    );
  }
}
