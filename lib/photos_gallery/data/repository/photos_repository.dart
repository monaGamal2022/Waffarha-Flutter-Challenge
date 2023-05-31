import 'package:dartz/dartz.dart';
import 'package:waffarha_challenge/core/api_manager.dart';
import 'package:waffarha_challenge/photos_gallery/data/models/photes_api_response_model.dart';
import 'package:waffarha_challenge/photos_gallery/data/requests/get_phots_request.dart';

class PhotosRepository {
  final APIsManager _apIsManager;

  PhotosRepository(this._apIsManager);

  Future<Either<Failure, PhotosApiResponseModel>> getPhotosList() async {
    final result = await _apIsManager.send(
      request: GetPhotosRequest(),
      responseFromMap: (map) =>
          PhotosApiResponseModel.fromMap(map as List<Map<String, dynamic>>),
    );

    return result;
  }
}
