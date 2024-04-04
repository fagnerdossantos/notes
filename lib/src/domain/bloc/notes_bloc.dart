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
    on<NoteCreate>(
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
    on<NoteUpdate>(
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
    on<NoteDelete>(
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
    on<NoteSetFavorite>(
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
    on<NoteGetFavorite>(
      (event, emit) async {
        emit(
          LoadedState(
            models: await _repository.getFavoriteNotes(),
          ),
        );
      },
    );

    // Filtering list
    on<NoteFilter>((event, emit) async {
      List<NoteModel> models;

      models = _filterNotesBySearch(
        search: event.search,
        notes: await switch (currentView) {
          ViewKey.home => _repository.loadAllNotes(),
          ViewKey.favorite => _repository.getFavoriteNotes(),
          _ => _repository.loadAllNotes(), // !
        },
      );

      // State
      emit(
        models.isNotEmpty
            ? FilteredState(models: models)
            : LoadedState(models: models),
      );
    });
  }
}

// Aux filter func
bool customSearch(NoteModel item, String search) {
  return item.title.toLowerCase().contains(search.toLowerCase());
}

List<NoteModel> _filterNotesBySearch({
  required List<NoteModel> notes,
  required String search,
}) {
  if (search.isNotEmpty) {
    return notes.where((item) => customSearch(item, search)).toList();
  }

  return notes;
}
