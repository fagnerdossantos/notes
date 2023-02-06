import 'package:bloc/bloc.dart';
import 'package:notes/src/database/notes_db.dart';
import 'package:notes/src/notes/models/notes_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  // Repository
  final Database _repository = Database();

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

    //Update
    on<UpdateNoteEvent>(
      (event, emit) {
        emit(
          NotesSuccessState(
            notesList: _repository.updateNote(event.previusNote, event.newNote),
          ),
        );
      },
    );
  }
}
