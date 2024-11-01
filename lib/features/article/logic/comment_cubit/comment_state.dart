part of 'comment_cubit.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}

final class CommentsLoading extends CommentState {}

final class CommentsSuccess extends CommentState {}

final class CommentsFailure extends CommentState {
  final String message;
  const CommentsFailure({required this.message});
}

final class AddCommentLoading extends CommentState {}

final class AddCommentSuccess extends CommentState {}

final class AddCommentFailure extends CommentState {
  final String message;
  const AddCommentFailure({required this.message});
}
