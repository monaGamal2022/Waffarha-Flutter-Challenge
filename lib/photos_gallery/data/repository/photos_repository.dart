import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:waffarha_challenge/core/api_manager.dart';
import 'package:waffarha_challenge/photos_gallery/data/models/photes_api_response_model.dart';
import 'package:waffarha_challenge/photos_gallery/data/requests/get_phots_request.dart';

class PhotosRepository {
  final APIsManager _apIsManager;

  PhotosRepository(this._apIsManager);

  Future<Either<Failure, Future<PhotosApiResponseModel>>>
      getPhotosList() async {
    log("starting time of calling api" + DateTime.now().toString());

    final result = await _apIsManager.send(
      request: GetPhotosRequest(),
      isListResponse: true,
      responseFromList: (list) async {
        log("starting time of parsing" + DateTime.now().toString());

        return deserializePhotosApiResponseModel(list);
      },
    );
    log("end time of parsing" + DateTime.now().toString());
    return result;
  }
}

Future<PhotosApiResponseModel> deserializePhotosApiResponseModel(List list) {
  return compute(deserializeJson, list);
}

PhotosApiResponseModel deserializeJson(List d) {
  return PhotosApiResponseModel.fromMap(d);
}
