import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/bloc/notes_bloc.dart';
import 'package:notes/src/global/theme_switch.dart';
import 'package:notes/src/routes/app_router.dart';
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
        create: ((_) => ThemeSwitch()),

        child: Consumer<ThemeSwitch>(
          builder: ((context, value, child) {
            return MaterialApp(
              onGenerateRoute: routes.onGeneratedRoute,

              // Theme
              theme: value.theme,

              debugShowCheckedModeBanner: false,
            );
          }),
        ),
      ),
    );
  }
}
