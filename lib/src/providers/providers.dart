import 'package:provider/provider.dart'
    show ChangeNotifierProvider, Provider, ReadContext;

import 'package:provider/single_child_widget.dart';

import '../../database/objectbox_database.dart';
import '../data/repository/notes_repository.dart';
import '../domain/bloc/navigation_bloc.dart';
import '../domain/bloc/notes_bloc.dart';
import 'selected_item_drawer_provider.dart';

List<SingleChildWidget> providersList = [
  // Database
  Provider(create: (_) => ObjectboxDatabase()),

  // Repositories
  Provider(
    create: (context) => NotesRepository(
      context.read<ObjectboxDatabase>(),
    ),
  ),

  // Change notifiers
  ChangeNotifierProvider(create: (_) => SelectedItemDrawer()),

  // Bloc
  Provider(
    create: (_) => NavigationBloc(),
  ),

  Provider(create: (context) => NotesBloc(context.read<NotesRepository>())),
];
