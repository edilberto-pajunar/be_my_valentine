import 'package:be_my_valentine/core/errors/failure.dart';
import 'package:be_my_valentine/core/params/params.dart';
import 'package:be_my_valentine/src/domain/entities/photo.dart';
import 'package:dartz/dartz.dart';

abstract class PhotoRepository {

  Future<Either<Failure,List<PhotoEntity>>> getPhotos({required String id});

  Future<void> addPhotos({required PhotoParams params});
}
