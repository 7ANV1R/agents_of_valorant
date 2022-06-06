part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded(this.apiResult);

  final List<Agent> apiResult;
}

class HomeError extends HomeState {}
