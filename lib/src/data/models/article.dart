import 'package:be_my_valentine/src/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  
  const ArticleModel({
    required String title,
    required String description,
    required String? urlToImage,
  }) : super(
    title: title,
    description: description,
    urlToImage: urlToImage ?? "",
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json["title"],
      description: json["description"],
      urlToImage: json["urlToImage"],
    );
  }
}