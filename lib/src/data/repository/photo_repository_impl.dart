import 'package:be_my_valentine/core/errors/failure.dart';
import 'package:be_my_valentine/core/params/params.dart';
import 'package:be_my_valentine/src/data/data_sources/remote/photo_remote_data_source.dart';
import 'package:be_my_valentine/src/domain/entities/photo.dart';
import 'package:be_my_valentine/src/domain/repository/photo_repository.dart';
import 'package:dartz/dartz.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource _photoRemoteService;

  const PhotoRepositoryImpl(this._photoRemoteService);

  @override
  Future<Either<Failure,List<PhotoEntity>>> getPhotos({
    required String id,
  }) async {
    try {
      final List<PhotoEntity> getPhotos = await _photoRemoteService.getPhotos(id: id);
      return Right(getPhotos);
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: "This is a server exception: $e",
      ));
    }
  }

  @override
  Future<void> addPhotos({required PhotoParams params}) async {
    await _photoRemoteService.addPhotos(params: params);
  }
}