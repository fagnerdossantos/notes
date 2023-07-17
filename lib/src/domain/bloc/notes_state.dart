part of 'notes_bloc.dart';

sealed class NotesState {}

class InitialState extends NotesState {}

class LoadedState extends NotesState {
  final List<NoteModel> models;

  LoadedState({required this.models});
}

class FilteredState extends NotesState {
  final List<NoteModel> models;

  FilteredState({required this.models});
}


class NoDataState extends NotesState {}
