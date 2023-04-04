part of 'notes_bloc.dart';

abstract class NotesEvent {}

class LoadNotes extends NotesEvent {}

class CreateNote extends NotesEvent {
  final NoteModel model;

  CreateNote({required this.model});
}

class UpdateNote extends NotesEvent {
  final NoteModel model;

  UpdateNote({required this.model});
}

class DeleteNote extends NotesEvent {
  final int id;

  DeleteNote({required this.id});
}

class SearchNote extends NotesEvent {
  final String search;

  SearchNote({required this.search});
}
