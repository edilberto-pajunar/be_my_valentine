import 'package:be_my_valentine/core/usecases/usecase.dart';
import 'package:be_my_valentine/core/utils/typedef.dart';
import 'package:be_my_valentine/src/data/models/photo.dart';
import 'package:be_my_valentine/src/domain/repository/photo_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoUseCase extends UseCaseWithParams<void, PhotoParams> {
  final PhotoRepository _photoRepository;

  AddPhotoUseCase(this._photoRepository);

  @override
  ResultVoid call(PhotoParams params) async {
    return await _photoRepository.addPhotos(params: params);
  }
}

class PhotoParams extends Equatable {
  final XFile file;
  final PhotoModel photoModel;

  const PhotoParams({
    required this.file,
    required this.photoModel,
  });

  @override
  List<Object> get props => [file, photoModel];
}