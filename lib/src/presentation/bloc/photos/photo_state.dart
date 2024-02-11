part of 'photo_bloc.dart';

@immutable
abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoAdded extends PhotoState {
  final PhotoModel photoModel;

  PhotoAdded({
    required this.photoModel,
  });
}


