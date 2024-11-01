part of 'app_layout_cubit.dart';

sealed class AppLayoutState extends Equatable {
  const AppLayoutState();

  @override
  List<Object> get props => [];
}

final class AppLayoutInitial extends AppLayoutState {}


final class PageChanged extends AppLayoutState{
  final int pageIndex;
  const PageChanged({required this.pageIndex});  
  
  @override
  List<Object> get props => [pageIndex];
}
