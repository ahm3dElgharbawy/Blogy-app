import 'package:blog_app/core/constants/endpoints.dart';
import 'package:blog_app/core/helpers/dio_helper.dart';
import 'package:blog_app/features/article/data/models/category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  static CategoryCubit get(context) => BlocProvider.of(context);
  List<CategoryModel> categories = [];
  void getCategories() {
    emit(CategoryLoading());
    DioHelper.getData(url: EndPoints.categories).then(
      (result) => result.fold(
        (failure) {
          emit(CategoryFailure(message: failure.message));
        },
        (response) {
          List cats = response.data['data'];
          categories = cats.map((c) => CategoryModel.fromJson(c)).toList();
          emit(
            CategorySuccess(categories: categories),
          );
        },
      ),
    );
  }
}
