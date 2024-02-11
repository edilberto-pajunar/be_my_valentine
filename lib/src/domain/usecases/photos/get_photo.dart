import 'package:be_my_valentine/core/errors/failure.dart';
import 'package:be_my_valentine/src/domain/entities/photo.dart';
import 'package:be_my_valentine/src/domain/repository/photo_repository.dart';
import 'package:dartz/dartz.dart';

class GetPhotoUseCase {
  final PhotoRepository _photoRepository;

  GetPhotoUseCase(this._photoRepository);

  Stream<Either<Failure,List<PhotoEntity>>> call({
    required String id,
  }) {
    return _photoRepository.getPhotos(id: id);
  }
}