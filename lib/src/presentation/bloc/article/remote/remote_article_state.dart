part of 'remote_article_bloc.dart';

abstract class RemoteArticleState extends Equatable {

  @override
  List<Object> get props => [];
}

class RemoteArticlesLoading extends RemoteArticleState {
  RemoteArticlesLoading();

  @override
  List<Object> get props => [];
}

class RemoteArticlesDone extends RemoteArticleState {
  RemoteArticlesDone({
    required this.articles,
  });

  final List<ArticleEntity> articles;

  @override
  List<Object> get props => [];
}

class RemoteArticlesError extends RemoteArticleState {
  RemoteArticlesError({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => [];
}
