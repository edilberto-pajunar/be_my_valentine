import 'package:be_my_valentine/src/domain/entities/photo.dart';

class PhotoModel extends PhotoEntity {
  const PhotoModel({
    required super.image,
    required super.title,
    required super.description,
    required super.dateTime,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      image: json["image"],
      title: json["title"],
      description: json["description"],
      dateTime: json["dateTime"],
    );
  }

  toJson() => {
    "image": image,
    "title": title,
    "description": description,
    "dateTime": dateTime,
  };

}