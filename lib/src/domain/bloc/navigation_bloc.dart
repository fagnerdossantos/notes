import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../core/utils/types.dart';
import '../models/note_model.dart';
import '../models/screen_template.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    // HOME
    on<GoToHome>((event, emit) {
      emit(HomeState());
    });

    // FAVORITE
    on<GoToFavorite>((event, emit) {
      emit(FavoriteState());
    });

    // NOTE
    on<GoToNote>((event, emit) {
      emit(NoteState(model: event.model));
    });

    // HOME
    on<GoBackTo>((event, emit) {
      emit(
        (currentView == ViewKey.home) ? HomeState() : FavoriteState(),
      );
    });
  }
}
