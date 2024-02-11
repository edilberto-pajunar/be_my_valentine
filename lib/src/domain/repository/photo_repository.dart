import 'package:be_my_valentine/core/utils/typedef.dart';
import 'package:be_my_valentine/src/domain/entities/photo.dart';
import 'package:be_my_valentine/src/domain/usecases/photos/add_photo.dart';

abstract class PhotoRepository {

  ResultFuture<List<PhotoEntity>> getPhotos({required String id});

  ResultVoid addPhotos({required PhotoParams params});
}
