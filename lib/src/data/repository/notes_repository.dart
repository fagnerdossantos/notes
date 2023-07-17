import '../../../database/objectbox.g.dart' show Box, Store;
import '../../../database/objectbox_database.dart';
import '../../core/utils/types.dart';
import '../../domain/models/note_model.dart';
import '../../domain/models/screen_template.dart';
import '../../domain/repository/i_notes_repository.dart';

final class NotesRepository implements INotesRepository {
  late final ObjectboxDatabase _database;
  final List<NoteModel> _modelsList = [];

  NotesRepository(this._database);

  Future<Box> getBox() async {
    final Store store = await _database.getStore();
    return store.box<NoteModel>();
  }

  @override
  Future<List<NoteModel>> createNote({required NoteModel model}) async {
    final box = await getBox();
    box.put(model);
    return loadAllNotes();
  }

  @override
  Future<void> deleteNote({required int id}) async {
    final box = await getBox();
    box.remove(id);
  }

  @override
  Future<List<NoteModel>> getFavoriteNotes() async {
    final List<NoteModel> model = (await loadAllNotes())
        .where((element) => element.favorite == true)
        .toList();

    return model;
  }

  @override
  Future<List<NoteModel>> setFavoriteNotes({required NoteModel model}) async {
    return updateNote(newModel: model);
  }

  @override
  Future<List<NoteModel>> loadAllNotes() async {
    _modelsList.clear();
    final box = await getBox();
    _modelsList.addAll(box.getAll() as List<NoteModel>);

    return _modelsList;
  }

  @override
  Future<List<NoteModel>> updateNote({required NoteModel newModel}) async {
    final box = await getBox();
    box.put(newModel);

    return (currentView == ViewKey.home) ? loadAllNotes() : getFavoriteNotes();
  }
}
