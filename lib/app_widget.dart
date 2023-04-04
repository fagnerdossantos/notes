import 'package:flutter/material.dart';
import 'package:notes/app_router.dart';
import 'package:notes/src/providers/providers.dart';
import 'package:notes/src/themes/theme_class.dart';
import 'package:notes/src/themes/theme_dark.dart';
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
      child: ChangeNotifierProvider(
        create: (_) => ThemeClass(ThemeDark(), ThemeLight()),

        //
        child: Consumer<ThemeClass>(
          builder: (context, value, child) => MaterialApp(
            onGenerateRoute: routs.onGeneratedRoute,
            theme: context.watch<ThemeClass>().theme,
          ),
        ),
      ),
    );
  }
}
