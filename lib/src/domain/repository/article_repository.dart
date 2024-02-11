import 'package:be_my_valentine/core/resources/data_state.dart';
import 'package:be_my_valentine/src/domain/entities/article.dart';

/// [ArticleRepository] create a contract for the data to
/// implements
abstract class ArticleRepository {

  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}