part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

final class GoToHome extends NavigationEvent {}

final class GoToNote extends NavigationEvent {
  final NoteModel model;

  GoToNote({required this.model});
}

final class GoToFavorite extends NavigationEvent {}

final class GoBackTo extends NavigationEvent {}
