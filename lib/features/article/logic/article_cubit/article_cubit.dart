import 'dart:io';

import 'package:blog_app/core/constants/endpoints.dart';
import 'package:blog_app/core/helpers/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());
  static ArticleCubit get(context) => BlocProvider.of(context);

  void create({
    required int categoryId,
    required String title,
    required String body,
    File? image,
  }) async {
    emit(CreateArticleLoading());
    Map<String, dynamic> data = {
      'category_id': categoryId,
      'title': title,
      'body': body,
    };

    // Add the image file only if it is not null
    if (image != null) {
      data['image'] = await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      );
    }

    FormData formData = FormData.fromMap(data);

    DioHelper.postData(url: EndPoints.createArticle, body: formData).then(
      (result) => result.fold(
        (failure) {
          emit(CreateArticleFailure(message: failure.message));
        },
        (response) {
          emit(
            CreateArticleSuccess(message: response.data['message']),
          );
        },
      ),
    );
  }
}
