import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutInitial());
  static AppLayoutCubit get(context) => BlocProvider.of(context);

  void changePage(int pageIndex){
    emit(PageChanged(pageIndex: pageIndex));
  }
}
