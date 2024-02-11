import 'dart:convert';

import 'package:be_my_valentine/core/constants/strings/api.dart';
import 'package:be_my_valentine/core/resources/data_state.dart';
import 'package:be_my_valentine/src/data/data_sources/remote/news_api_service.dart';
import 'package:be_my_valentine/src/data/models/article.dart';
import 'package:be_my_valentine/src/domain/repository/article_repository.dart';

/// [ArticleRepositoryImpl] implements the repository from
/// the domain folder
class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl(this._newsApiService);

  final NewsApiService _newsApiService;

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    final response = await _newsApiService.getNewsArticles(
      apiKey: NewsApi.apiKey,
      country: NewsApi.country,
      category: NewsApi.category,
    );

    return response;

  }
}