import 'package:be_my_valentine/core/params/params.dart';
import 'package:be_my_valentine/src/domain/repository/photo_repository.dart';

class AddPhotoUseCase {
  final PhotoRepository _photoRepository;

  AddPhotoUseCase(this._photoRepository);

  Future<void> call({
    required PhotoParams params,
  }) async {
    _photoRepository.addPhotos(params: params);
  }
}