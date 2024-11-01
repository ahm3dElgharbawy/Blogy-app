import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  PageController pageController = PageController();
  int currentPageIndex = 0;

  // on tapping next button
  void next(){
    if(currentPageIndex == 2){ // number of screens - 1
      return emit(OnboardingCompletedState());
    }
    currentPageIndex++;
    pageController.animateToPage(currentPageIndex,duration: const Duration(milliseconds: 500),curve: Curves.linear ); // make transition effect
    // emit(OnboardingChangedState(currentPageIndex));
  }
  // on tapping skip button
  void skip(){
    currentPageIndex = 2;
    emit(OnboardingCompletedState()); 
  }
  // swipe screen
  void swipe(int pageIndex){
    currentPageIndex = pageIndex;
    emit(OnboardingChangedState(index: pageIndex));
  }
}
