import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/notes/blocs/notes_bloc.dart';
import 'package:notes/src/themes/theme_class.dart';
import 'package:notes/src/app/global/routes/app_router.dart';
import 'package:notes/src/themes/theme_dark.dart';
import 'package:notes/src/themes/theme_light.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter routes = AppRouter();

    return MultiBlocProvider(
      // Providers
      providers: [
        BlocProvider(create: (_) => NotesBloc()),
      ],

      // Notifier to change APP Theme
      child: ChangeNotifierProvider(
        // Consumer
        create: (_) => ThemeClass(ThemeDark(), ThemeLight()),

        child: Consumer<ThemeClass>(
          builder: (context, value, child) {
            return MaterialApp(
              onGenerateRoute: routes.onGeneratedRoute,

              // Theme
              theme: value.theme,

              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
