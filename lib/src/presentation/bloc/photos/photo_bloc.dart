
import 'package:be_my_valentine/extension/date.dart';
import 'package:be_my_valentine/src/data/data_sources/remote/photo_remote_data_source.dart';
import 'package:be_my_valentine/src/data/models/photo.dart';
import 'package:be_my_valentine/src/domain/usecases/photos/add_photo.dart';
import 'package:be_my_valentine/src/presentation/screens/bottom_bar/add.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';


part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRemoteDataSource _photoRemoteService;

  PhotoBloc(this._photoRemoteService) : super(PhotoInitial()) {
    on<AddPhoto>(_onAddPhoto);
  }

  void _onAddPhoto(AddPhoto event, Emitter emit) async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    final DateTime now = DateTime.now();

    if (file != null) {
      final PhotoModel photoModel = PhotoModel(
        image: file.path,
        title: event.title,
        description: event.description,
        dateTime: now.toDateCollectionId(),
      );

      _photoRemoteService.addPhotos(params: PhotoParams(
        file: file,
        photoModel: photoModel,
      ));
    }
  }

}
