part of 'notes_bloc.dart';

abstract class NotesState {
  final List<NoteModel> models;

  NotesState({required this.models});
}

class NotesInitial extends NotesState {
  NotesInitial({required super.models});
}

class NotesSuccess extends NotesState {
  NotesSuccess({required super.models});
}

class NotesFiltered extends NotesState {
  NotesFiltered({required super.models});
}

class NotesNoData extends NotesState {
  NotesNoData({required super.models});
}
