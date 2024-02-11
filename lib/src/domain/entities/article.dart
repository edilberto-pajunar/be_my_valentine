import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {

  const ArticleEntity({
    required this.title,
    required this.description,
    required this.urlToImage,
  });

  final String title;
  final String description;
  final String urlToImage;

  @override
  List<Object> get props => [title, description, urlToImage];
}