import 'package:be_my_valentine/src/data/models/photo.dart';
import 'package:image_picker/image_picker.dart';

class PhotoParams{
  final XFile file;
  final PhotoModel photoModel;

  PhotoParams({
    required this.file,
    required this.photoModel,
  });
}