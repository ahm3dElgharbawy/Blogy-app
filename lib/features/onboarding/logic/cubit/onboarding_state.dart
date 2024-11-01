part of 'onboarding_cubit.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

final class OnboardingInitial extends OnboardingState {}

class OnboardingChangedState extends OnboardingState {
  final int index;
  const OnboardingChangedState({required this.index});
    @override
  List<Object> get props => [index];
}

class OnboardingCompletedState extends OnboardingState {}
