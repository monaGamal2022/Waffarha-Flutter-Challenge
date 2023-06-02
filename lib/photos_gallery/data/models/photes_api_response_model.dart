import 'package:waffarha_challenge/photos_gallery/data/models/photo_item_model.dart';

class PhotosApiResponseModel {
  final List<PhotoItemModel> photosList;

  PhotosApiResponseModel({required this.photosList});

  factory PhotosApiResponseModel.fromMap(List map) {
    return PhotosApiResponseModel(
      photosList: List<PhotoItemModel>.from(
        map.map((x) => PhotoItemModel.fromMap(x)),
      ),
    );
  }
}
