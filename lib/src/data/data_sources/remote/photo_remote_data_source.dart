import 'dart:io';

import 'package:be_my_valentine/core/constants/strings/firebase_collection.dart';
import 'package:be_my_valentine/extension/date.dart';
import 'package:be_my_valentine/src/data/models/photo.dart';
import 'package:be_my_valentine/src/domain/usecases/photos/add_photo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class PhotoRemoteDataSource {
  const PhotoRemoteDataSource();

  Future<List<PhotoModel>> getPhotos({required String id});
  Future<void> addPhotos({required PhotoParams params});
}

class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {

  final String photos = FirebaseCollection.photo;
  final String dateCollectionId = DateTime.now().toDateCollectionId();

  @override
  Future<void> addPhotos({
    required PhotoParams params,
  }) async {
    String imageUrl = "";
    final String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final FirebaseFirestore db = FirebaseFirestore.instance;

    Reference ref = FirebaseStorage.instance.ref();
    Reference refDirImages = ref.child(photos).child(dateCollectionId);

    Reference refImageToUpload = refDirImages.child(uniqueFileName);

    try {
      // await refImageToUpload.putFile(File(params.file.path));
      // imageUrl = await refImageToUpload.getDownloadURL();

      // db.collection(photos).doc(dateCollectionId).set({
      //   "photos": params.photoModel.toJson(),
      // });
    } on FirebaseException catch (e) {
      throw();
    }
  }

  @override
  Future<List<PhotoModel>> getPhotos({
    required String id,
  }) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    try {
      final data = await db.collection(photos).doc(dateCollectionId).get().then((event) {
        final map = event.data() as Map<String, dynamic>;

        return (map["photos"] as List).map((e) => PhotoModel.fromJson(e)).toList();
      });

      return data;
    } catch (e) {
      throw();
    }
  }
}
