part of 'notes_bloc.dart';

sealed class NotesEvent {}

class LoadEvent extends NotesEvent {}

class NoteCreate extends NotesEvent {
  final NoteModel model;

  NoteCreate({required this.model});
}

class NoteUpdate extends NotesEvent {
  final NoteModel model;

  NoteUpdate({required this.model});
}

class NoteDelete extends NotesEvent {
  final int id;

  NoteDelete({required this.id});
}

class NoteFilter extends NotesEvent {
  final String search;

  NoteFilter({required this.search});
}

class NoteSetFavorite extends NotesEvent {
  final NoteModel model;

  NoteSetFavorite({required this.model});
}

class NoteGetFavorite extends NotesEvent {}
