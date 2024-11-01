import 'package:blog_app/core/constants/endpoints.dart';
import 'package:blog_app/core/helpers/dio_helper.dart';
import 'package:blog_app/features/article/data/models/comment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  static CommentCubit get(context) => BlocProvider.of(context);
  List<CommentModel> comments = [];

  getComments(int articleId) {
    emit(CommentsLoading());
    DioHelper.getData(
      url: EndPoints.getComments(articleId),
    ).then(
      (result) => result.fold(
        (failure) {
          emit(CommentsFailure(message: failure.message));
        },
        (response) {
          comments = (response.data['data'] as List).map((comment) => CommentModel.fromJson(comment)).toList(); 
          emit(CommentsSuccess());
        },
      ),
    );
  }
  addComment(int articleId,String comment) {
    emit(AddCommentLoading());
    DioHelper.postData(
      url: EndPoints.addComment(articleId),
      body: {
        'comment' : comment
      }
    ).then(
      (result) => result.fold(
        (failure) {
          emit(AddCommentFailure(message: failure.message));
        },
        (response) {
          comments.add(CommentModel.fromJson(response.data['data'])); 
          emit(AddCommentSuccess());
        },
      ),
    );
  }
}
