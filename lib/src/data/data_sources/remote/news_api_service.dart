import 'dart:convert';

import 'package:be_my_valentine/core/constants/strings/api.dart';
import 'package:be_my_valentine/core/resources/data_state.dart';
import 'package:be_my_valentine/src/data/models/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class NewsApiService {
  const NewsApiService();

  Future<DataState<List<ArticleModel>>> getNewsArticles({
    required String apiKey,
    required String country,
    required String category,
  });
}

class NewsApiServiceImpl implements NewsApiService {
  const NewsApiServiceImpl(this._client);

  final http.Client _client;

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles({
    required String apiKey,
    required String country,
    required String category,
  }) async {
    // 1. check to make s ure that it returns the right data when the response code
    // is 200 or the proper response code
    final Uri uri = Uri.https(NewsApi.url, "/v2/everything", {
      "q": "bitcoin",
      "apiKey": NewsApi.apiKey,
    });

    try {
      debugPrint("Calling: $uri");
      final response = await _client.post(uri, headers: {
        "Content-Type": "application/json",
      });
      debugPrint("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        final List<ArticleModel> articles = (body["articles"] as List).map((data) {
          return ArticleModel.fromJson(data);
        }).toList();

        return DataSuccess(articles);
      } else {
        return DataFailed("Error! Status Code: ${response.statusCode}");
      }
    } catch (e) {
      return DataFailed(e.toString());
    }

    // 2. check to make sure that it "THROWS A CUSTOM EXCEPTION" with the right
    // message when status code is the bad one
  }

}