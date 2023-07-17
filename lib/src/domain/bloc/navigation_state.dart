part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}

final class HomeState extends NavigationState {}

final class NoteState extends NavigationState {
  final NoteModel model;

  NoteState({required this.model});
}

final class FavoriteState extends NavigationState {}
