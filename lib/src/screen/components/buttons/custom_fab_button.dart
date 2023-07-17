import 'package:flutter/material.dart'
    show
        BuildContext,
        FloatingActionButton,
        Icon,
        IconData,
        StatelessWidget,
        Widget;

class CustomFabButton extends StatelessWidget {
  final Function() callback;
  final IconData icon;
  const CustomFabButton(
      {super.key, required this.callback, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: callback,
      child: Icon(icon),
    );
  }
}
