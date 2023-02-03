import 'package:flutter/material.dart';
import 'package:notes/src/notes/models/notes_model.dart';

class Database extends ChangeNotifier {
  final List<NotesModel> _notesList = [];
  int id = 0;

  List<NotesModel> get notesList => _notesList;

  void create(NotesModel note) {
    _notesList.add(note);
    notifyListeners();
  }

  void delete(int index) {
    _notesList.removeAt(index);
    notifyListeners();
  }

  void update(NotesModel original, NotesModel newOne) {
    final int index = _notesList.indexOf(original);
    _notesList[index] = newOne;
    notifyListeners();
  }

  void generateId() {
    id++;
  }

  List<String> getDate() {
    final time = DateTime.now();

    final String date = "${time.day}-${time.month}-${time.year}";
    final String hour = "${time.hour}:${time.minute}:${time.second}";

    return [date, hour];
  }
}
