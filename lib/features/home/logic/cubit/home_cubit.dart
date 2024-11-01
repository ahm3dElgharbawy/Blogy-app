import 'package:blog_app/core/constants/endpoints.dart';
import 'package:blog_app/core/helpers/dio_helper.dart';
import 'package:blog_app/features/home/data/models/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<ArticleModel> articles = [];
  getArticles() {
    emit(HomeArticlesLoading());
    DioHelper.getData(url: EndPoints.homeArticles).then(
      (result) => result.fold(
        (failure) {
          emit(HomeArticlesFailure(message: failure.message));
        },
        (response) {
          List data = response.data['data'];
          articles = data.map((article) => ArticleModel.fromJson(article)).toList();
          emit(
            HomeArticlesSuccess(),
          );
        },
      ),
    );
  }
}
