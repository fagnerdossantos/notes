import 'package:notes/src/app/note/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NotesRepository {
  final List<NoteModel> _notesList = [];

  Future<List<NoteModel>> create(
      {required Database instance, required NoteModel note}) async {
    if (_notesList.isNotEmpty) _notesList.clear();

    // Id Check
    final result = await instance.rawQuery(
      'SELECT id FROM notes WHERE id = ?',
      [note.id],
    );

    // Creating
    result.isEmpty
        ? await instance.rawInsert(
            "INSERT INTO Notes(id, title, note, date, hour) VALUES (?,?,?,?,?)",
            [
                note.id,
                note.title,
                note.note,
                note.date,
                note.hour,
              ])
        : false;

    return readAll(instance: instance);
  }

  Future<List<NoteModel>> readAll({required Database instance}) async {
    if (_notesList.isNotEmpty) _notesList.clear();

    // Getting the notes
    final notes = await instance.rawQuery("SELECT * FROM Notes");

    if (notes.isNotEmpty) {
      _notesList.addAll(notes.map((e) => NoteModel.fromMap(e)));
    }

    return _notesList;
  }

  Future<List<NoteModel>> update(
      {required Database instance,
      required int id,
      required NoteModel model}) async {
    if (_notesList.isNotEmpty) _notesList.clear();

    // Updating
    await instance.rawUpdate('''
      UPDATE notes
      SET title = ?, note = ?, date = ?, hour = ?
      WHERE id = ?
  ''', [
      model.title,
      model.note,
      model.date,
      model.hour,
      id,
    ]);
    return readAll(instance: instance);
  }

  Future<List<NoteModel>> delete(
      {required Database instance, required int id}) async {
    if (_notesList.isNotEmpty) _notesList.clear();

    // Deleting
    await instance.rawDelete("DELETE FROM Notes WHERE id = ?", [id]);
    return readAll(instance: instance);
  }
}
