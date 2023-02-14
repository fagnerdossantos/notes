import 'package:notes/src/app/notes/models/notes_model.dart';

class Repository {
  final List<NotesModel> _notesList = [];

  List<NotesModel> get notesList => _notesList;

  List<NotesModel> loadNotes(NotesModel model) {
    return notesList;
  }

  List<NotesModel> createNote(NotesModel model) {
    _notesList.add(model);

    return _notesList;
  }

  List<NotesModel> removeNote(NotesModel model) {
    _notesList.remove(model);

    return _notesList;
  }

  List<NotesModel> updateNote(NotesModel previus, NotesModel newModel) {
    _notesList[_notesList.indexOf(previus)] = newModel;
    return _notesList;
  }

  List<NotesModel> searchNote(String search) {
    return _notesList
        .where((element) => element.title.contains(search))
        .toList();
  }
}
