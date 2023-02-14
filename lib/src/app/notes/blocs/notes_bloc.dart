import 'package:bloc/bloc.dart';
import 'package:notes/src/repository/repository.dart';
import 'package:notes/src/app/notes/models/notes_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  // Repository
  final Repository _repository = Repository();

  // Initial
  NotesBloc() : super(NotesInitialState(notesList: [])) {
    //
    on<LoadNoteEvent>((event, emit) {
      emit(NotesInitialState(notesList: _repository.notesList));
    });

    // Create
    on<AddNoteEvent>(
      (event, emit) {
        emit(
          NotesSuccessState(
            notesList: _repository.createNote(event.note),
          ),
        );
      },
    );

    // Remove
    on<RemoveNoteEvent>(
      (event, emit) {
        emit(
          NotesSuccessState(
            notesList: _repository.removeNote(event.note),
          ),
        );
      },
    );

    // Update
    on<UpdateNoteEvent>(
      (event, emit) {
        emit(
          NotesSuccessState(
            notesList: _repository.updateNote(event.previusNote, event.newNote),
          ),
        );
      },
    );

    // Search
    on<SearchNoteEvent>(
      (event, emit) {
        emit(
          NotesSuccessState(
            notesList: _repository.searchNote(event.search),
          ),
        );
      },
    );
  }
}
