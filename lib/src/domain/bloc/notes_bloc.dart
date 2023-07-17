import 'package:flutter_bloc/flutter_bloc.dart' show Bloc;

import '../../core/utils/types.dart';
import '../../data/repository/notes_repository.dart';
import '../models/note_model.dart';
import '../models/screen_template.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  // dependencies
  final NotesRepository _repository;

  NotesBloc(this._repository) : super(LoadedState(models: [])) {
    // LOAD
    on<LoadEvent>(
      (event, emit) async {
        emit(LoadedState(models: await _repository.loadAllNotes()));
      },
    );

    // CREATE
    on<CreateEvent>(
      (event, emit) async {
        emit(
          LoadedState(
            models: await _repository.createNote(
              model: event.model,
            ),
          ),
        );
      },
    );

    // UPDATE
    on<UpdateEvent>(
      (event, emit) async {
        emit(
          LoadedState(
            models: await _repository.updateNote(
              newModel: event.model,
            ),
          ),
        );
      },
    );

    // DELETE
    on<DeleteEvent>(
      (event, emit) async {
        // Deleting in a given id
        await _repository.deleteNote(id: event.id);

        emit(
          LoadedState(
            models: currentView == ViewKey.home
                ? await _repository.loadAllNotes()
                : await _repository.getFavoriteNotes(),
          ),
        );
      },
    );

    // Set
    on<SetFavoriteEvent>(
      (event, emit) async {
        await _repository.setFavoriteNotes(model: event.model);

        emit(
          LoadedState(
            models: currentView == ViewKey.home
                ? await _repository.loadAllNotes()
                : await _repository.getFavoriteNotes(),
          ),
        );
      },
    );

    // Get FAVORITE
    on<GetFavoriteEvent>(
      (event, emit) async {
        emit(
          LoadedState(
            models: await _repository.getFavoriteNotes(),
          ),
        );
      },
    );

    // Filtering list
    on<FilterEvent>((event, emit) async {
      List<NoteModel> models;

      switch (currentView) {
        case ViewKey.home:

          // Notes
          models = await _filterNotesBySearch(
              _repository.loadAllNotes(), event.search);

          // State
          emit(models.isNotEmpty
              ? FilteredState(models: models)
              : LoadedState(models: models));

          break;

        case ViewKey.favorite:

          // Notes
          models = await _filterNotesBySearch(
              _repository.getFavoriteNotes(), event.search);

          // State
          emit(models.isNotEmpty
              ? FilteredState(models: models)
              : LoadedState(models: models));

          break;

        default:
          break;
      }
    });
  }
}

// Aux filter func
Future<List<NoteModel>> _filterNotesBySearch(
    Future<List<NoteModel>> notesFuture, String search) async {
  final notes = await notesFuture;

  if (search.isNotEmpty) {
    return notes
        .where(
            (note) => note.title.toLowerCase().contains(search.toLowerCase()))
        .toList();
  } else {
    return notes;
  }
}
