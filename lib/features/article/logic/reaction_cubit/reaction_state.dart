part of 'reaction_cubit.dart';

sealed class ReactionState extends Equatable {
  const ReactionState();

  @override
  List<Object> get props => [];
}

final class ReactionInitial extends ReactionState {}

final class ReactionLoading extends ReactionState {}

final class ReactionSuccess extends ReactionState {}

final class ReactionFailure extends ReactionState {
  final String message;
  const ReactionFailure({required this.message});
}
