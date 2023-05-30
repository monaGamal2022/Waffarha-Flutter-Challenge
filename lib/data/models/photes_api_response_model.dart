import 'package:waffarha_challenge/data/models/photo_item_model.dart';

class PhotosApiResponseModel {
  final List<PhotoItemModel> photosList;

  PhotosApiResponseModel({required this.photosList});

  factory PhotosApiResponseModel.fromMap(List<Map<String, dynamic>> map) {
    return PhotosApiResponseModel(
      photosList: List<PhotoItemModel>.from(
        map.map((x) => PhotoItemModel.fromMap(x)),
      ),
    );
  }
}
