// import 'package:be_my_valentine/core/resources/data_state.dart';
// import 'package:be_my_valentine/core/usecases/usecase.dart';
// import 'package:be_my_valentine/src/domain/entities/article.dart';
// import 'package:be_my_valentine/src/domain/repository/article_repository.dart';
//
// /// [GetArticleUseCase] returns an entity instead of model
// /// so that, it can be flexible to the other functions
// class GetArticleUseCase extends UseCase<DataState<List<ArticleEntity>>, void> {
//   final ArticleRepository _articleRepository;
//
//   GetArticleUseCase(this._articleRepository);
//
//   @override
//   Future<DataState<List<ArticleEntity>>> call({
//     void params,
//   }) async {
//     return _articleRepository.getNewsArticles();
//   }
// }
