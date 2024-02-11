part of 'photo_bloc.dart';

@immutable
abstract class PhotoEvent {}

class AddPhoto extends PhotoEvent {
  AddPhoto({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}
