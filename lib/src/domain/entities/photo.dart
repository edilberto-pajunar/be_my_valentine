import 'package:equatable/equatable.dart';

class PhotoEntity extends Equatable {
  const PhotoEntity({
    required this.image,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  final String image;
  final String title;
  final String description;
  final String dateTime;

  @override
  List<Object?> get props => [image, title, description, dateTime];
}
