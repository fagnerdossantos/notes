import 'package:flutter/material.dart';
import 'package:notes/src/database/notes_db.dart';
import 'package:notes/src/global/theme_switch.dart';
import 'package:notes/src/home/pages/home_page.dart';
import 'package:notes/src/notes/pages/note_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Providers
      providers: [
        ChangeNotifierProvider(create: (context) => Database()),
      ],

      // Notifier to change APP Theme
      child: ChangeNotifierProvider(
        // Consumer
        create: ((_) => ThemeSwitch()),

        child: Consumer<ThemeSwitch>(
          builder: ((context, value, child) {
            return MaterialApp(
              // Routs
              initialRoute: "/",

              routes: {
                "/": (_) => const HomePage(),
                "/note": (_) => const NotePage()
              },

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
