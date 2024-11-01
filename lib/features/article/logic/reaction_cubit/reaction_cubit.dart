
import 'package:blog_app/core/constants/endpoints.dart';
import 'package:blog_app/core/helpers/dio_helper.dart';
import 'package:blog_app/features/article/data/models/emoji.dart';
import 'package:blog_app/features/home/data/models/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'reaction_state.dart';

class ReactionCubit extends Cubit<ReactionState> {
  ReactionCubit() : super(ReactionInitial());
  static ReactionCubit get(context) => BlocProvider.of(context);

  addReaction(ArticleModel article, Emoji emoji) {
    emit(ReactionLoading());
    DioHelper.postData(
      url: EndPoints.addReaction(article.id),
      body: {"type": emoji.title},
    ).then(
      (result) => result.fold(
        (failure) {
          emit(ReactionFailure(message: failure.message));
        },
        (response) {
          article.updateFromJson(response.data['data']);
          // article.addReaction();
          emit(ReactionSuccess());
        },
      ),
    );
  }

  removeReaction(ArticleModel article) {
    emit(ReactionLoading());
    DioHelper.deleteData(url: EndPoints.removeReaction(article.myReaction!.id))
        .then(
      (result) => result.fold(
        (failure) {
          emit(ReactionFailure(message: failure.message));
        },
        (response) {
          article.updateFromJson(response.data['data']);
          // article.
          emit(
            ReactionSuccess(),
          );
        },
      ),
    );
  }
}
