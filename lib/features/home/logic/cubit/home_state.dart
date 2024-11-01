part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class HomeArticlesLoading extends HomeState {}
final class HomeArticlesSuccess extends HomeState {}
final class HomeArticlesFailure extends HomeState {
  final String message;
  const HomeArticlesFailure({required this.message});
}
