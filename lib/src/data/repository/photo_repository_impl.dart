import 'package:be_my_valentine/core/errors/failure.dart';
import 'package:be_my_valentine/core/utils/typedef.dart';
import 'package:be_my_valentine/src/data/data_sources/remote/photo_remote_data_source.dart';
import 'package:be_my_valentine/src/data/models/photo.dart';
import 'package:be_my_valentine/src/domain/entities/photo.dart';
import 'package:be_my_valentine/src/domain/repository/photo_repository.dart';
import 'package:be_my_valentine/src/domain/usecases/photos/add_photo.dart';
import 'package:dartz/dartz.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource _photoRemoteService;

  const PhotoRepositoryImpl(this._photoRemoteService);

  @override
  ResultFuture<List<PhotoModel>> getPhotos({
    required String id,
  }) async {
    try {
      final List<PhotoModel> getPhotos = await _photoRemoteService.getPhotos(id: id);
      return Right(getPhotos);
    } catch (e) {
      return Left(ServerFailure(
        errorMessage: "This is a server exception: $e",
      ));
    }
  }

  @override
  ResultVoid addPhotos({
    required PhotoParams params,
  }) async {
    await _photoRemoteService.addPhotos(params: params);
    return const Right(null);
  }

  // @override
  // ResultVoid addPhotos({
  //   required PhotoParams params,
  // }) async {
  //   await _photoRemoteService.addPhotos(params: params);
  // }
}