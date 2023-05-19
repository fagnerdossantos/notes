import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/app/global/bloc/notes_bloc.dart';
import 'package:notes/src/database/notes_db.dart';
import 'package:notes/src/providers/selected_item_drawer_provider.dart';
import 'package:notes/src/repository/notes_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providersList = [
  // Normal Providers
  Provider(create: (_) => NotesDb()),
  Provider(create: (_) => NotesRepository()),

  ChangeNotifierProvider(create: (_) => SelectedItemDrawerProvider()),

  // BLOC
  BlocProvider(
    create: (context) => NotesBloc(
      connection: context.read<NotesDb>(),
      repository: context.read<NotesRepository>(),
    ),
  ),
];
