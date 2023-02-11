import 'package:flutter/material.dart';
import 'package:notes/src/presentation/pages/create_note_page.dart';
import 'package:notes/src/presentation/pages/home_page.dart';
import 'package:notes/src/presentation/pages/note_page.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    // Routes
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: routeSettings,
        );

      case "/create":
        return MaterialPageRoute(
          builder: (_) => const CreateNotePage(),
          settings: routeSettings,
        );

      case "/note":
        return MaterialPageRoute(
          builder: (_) => const NotePage(),
          settings: routeSettings,
        );

      default:
        throw ("");
    }
  }
}
