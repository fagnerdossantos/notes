import 'package:bloc/bloc.dart';
import 'package:notes/src/app/note/models/note_model.dart';
import 'package:notes/src/database/notes_db.dart';
import 'package:notes/src/repository/notes_repository.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  // dependedncies
  final NotesDb connection;
  final NotesRepository repository;

  NotesBloc({required this.connection, required this.repository})
      : super(NotesInitial(models: [])) {
    // LOAD
    on<LoadNotes>(
      (event, emit) async {
        // Loading all notes
        final instance = await connection.database;

        final List<NoteModel> models = await repository.readAll(
          instance: instance,
        );

        models.isNotEmpty
            ? emit(NotesSuccess(models: models))
            : emit(NotesNoData(models: []));
      },
    );

    // CREATE
    on<CreateNote>(
      (event, emit) async {
        // Creating a note
        final instance = await connection.database;

        final List<NoteModel> models = await repository.create(
          instance: instance,
          note: event.model,
        );

        emit(NotesSuccess(models: models));
      },
    );

    // Update
    on<UpdateNote>(
      (event, emit) async {
        // Updating a note
        final instance = await connection.database;

        final List<NoteModel> models = await repository.update(
          instance: instance,
          id: event.model.id!,
          model: event.model,
        );

        emit(NotesSuccess(models: models));
      },
    );

    // Delete
    on<DeleteNote>(
      (event, emit) async {
        // Deleting a note
        final instance = await connection.database;

        final List<NoteModel> models = await repository.delete(
          instance: instance,
          id: event.id,
        );

        models.isNotEmpty
            ? emit(NotesSuccess(models: models))
            : emit(NotesNoData(models: []));
      },
    );

    on<SearchNote>(
      (event, emit) async {
        // Loading all notes
        final instance = await connection.database;

        final List<NoteModel> models = await repository.readAll(
          instance: instance,
        );

        emit(
          NotesFiltered(
            models: models
                .where((element) => element.title.contains(event.search))
                .toList(),
          ),
        );
      },
    );
  }
}
