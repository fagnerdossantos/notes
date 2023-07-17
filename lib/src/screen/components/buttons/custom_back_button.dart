import 'package:flutter/material.dart'
    show BuildContext, Icon, IconButton, Icons, StatelessWidget, Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext;

import '../../../domain/bloc/navigation_bloc.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigation
    final nav = context.read<NavigationBloc>();

    return IconButton(
      onPressed: () => nav.add(GoBackTo()),
      icon: const Icon(Icons.arrow_back_ios_new),
    );
  }
}
