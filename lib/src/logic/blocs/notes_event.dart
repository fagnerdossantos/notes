// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notes_bloc.dart';

abstract class NotesEvent {}

class LoadNoteEvent extends NotesEvent {}

class AddNoteEvent extends NotesEvent {
  NotesModel note;
  AddNoteEvent({
    required this.note,
  });
}

class RemoveNoteEvent extends NotesEvent {
  NotesModel note;
  RemoveNoteEvent({
    required this.note,
  });
}

class UpdateNoteEvent extends NotesEvent {
  NotesModel previusNote;
  NotesModel newNote;
  UpdateNoteEvent({
    required this.previusNote,
    required this.newNote,
  });
}
