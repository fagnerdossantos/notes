part of 'notes_bloc.dart';

abstract class NotesEvent {}

class LoadEvent extends NotesEvent {}

class CreateEvent extends NotesEvent {
  final NoteModel model;

  CreateEvent({required this.model});
}

class UpdateEvent extends NotesEvent {
  final NoteModel model;

  UpdateEvent({required this.model});
}

class DeleteEvent extends NotesEvent {
  final int id;

  DeleteEvent({required this.id});
}

class FilterEvent extends NotesEvent {
  final String search;

  FilterEvent({required this.search});
}

class SetFavoriteEvent extends NotesEvent {
  final NoteModel model;

  SetFavoriteEvent({required this.model});
}

class GetFavoriteEvent extends NotesEvent {}
