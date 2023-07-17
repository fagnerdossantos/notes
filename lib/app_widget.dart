import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, StatelessWidget, Widget;
import 'package:provider/provider.dart' show MultiProvider;

import 'src/core/themes/app_theme.dart';
import 'src/providers/providers.dart';
import 'src/screen/viewmodel/navigation_viewmodel.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // providers
      providers: providersList,

      //
      child: MaterialApp(
        theme: AppTheme.instance.theme,
        home: const NavigationViewModel(),
      ),
    );
  }
}
