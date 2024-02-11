import 'package:be_my_valentine/core/utils/typedef.dart';
import 'package:be_my_valentine/src/domain/entities/photo.dart';
import 'package:be_my_valentine/src/domain/repository/photo_repository.dart';

class GetPhotoUseCase {
  final PhotoRepository _photoRepository;

  GetPhotoUseCase(this._photoRepository);

  ResultFuture<List<PhotoEntity>> call({
    required String id,
  }) {
    return _photoRepository.getPhotos(id: id);
  }
}