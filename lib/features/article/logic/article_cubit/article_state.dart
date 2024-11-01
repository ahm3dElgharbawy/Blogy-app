part of 'article_cubit.dart';

sealed class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

final class ArticleInitial extends ArticleState {}

// show
final class ShowArticleLoading extends ArticleState {}

final class ShowArticleSuccess extends ArticleState {}

final class ShowArticleFailure extends ArticleState {
  final String message;
  const ShowArticleFailure({required this.message});
}

// create
final class CreateArticleLoading extends ArticleState {}

final class CreateArticleSuccess extends ArticleState {
  final String message;
  const CreateArticleSuccess({required this.message});
}

final class CreateArticleFailure extends ArticleState {
  final String message;
  const CreateArticleFailure({required this.message});
}

// update
final class UpdateArticleLoading extends ArticleState {}

final class UpdateArticleSuccess extends ArticleState {}

final class UpdateArticleFailure extends ArticleState {
  final String message;
  const UpdateArticleFailure({required this.message});
}

