import '../models/note_model.dart';

abstract interface class INotesRepository {
  // CREATE
  Future<List<NoteModel>> createNote({required NoteModel model});

  // LOAD
  Future<List<NoteModel>> loadAllNotes();
  Future<List<NoteModel>> getFavoriteNotes();
  Future<List<NoteModel>> setFavoriteNotes({required NoteModel model});

  // UPDATE
  Future<List<NoteModel>> updateNote({required NoteModel newModel});

  // DELETE
  Future<void> deleteNote({required int id});
}
