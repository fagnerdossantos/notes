part of 'notes_bloc.dart';

abstract class NotesState {
  List<NotesModel> notesList;
  NotesState({
    required this.notesList,
  });
}

class NotesInitialState extends NotesState {
  NotesInitialState({required super.notesList});
}

class NotesSuccessState extends NotesState {
  NotesSuccessState({required super.notesList});
}
