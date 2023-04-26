import 'package:flutter/material.dart';
import 'package:notes/src/providers/providers.dart';
import 'package:notes/src/router/app_router.dart';
import 'package:notes/src/themes/theme_light.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Routes
    final AppRouter routs = AppRouter();

    return MultiProvider(
      // providers
      providers: providersList,

      // Theming
      child: MaterialApp(
        onGenerateRoute: routs.onGeneratedRoute,
        theme: ThemeLight().light,
      ),
    );
  }
}
