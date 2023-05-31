import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffarha_challenge/core/api_manager.dart';
import 'package:waffarha_challenge/core/utils/nullable.dart';
import 'package:waffarha_challenge/photos_gallery/data/models/photes_api_response_model.dart';

import '../../data/repository/photos_repository.dart';

part 'photos_state.dart';

class PhotosGalleryCubit extends Cubit<PhotosGalleryState> {
  final PhotosRepository _photosRepository;

  PhotosGalleryCubit(this._photosRepository)
      : super(const PhotosGalleryState());

  Future<void> getPhotosList() async {
    emit(state.copyWith(isLoading: true));
    final result = await _photosRepository.getPhotosList();
    result.fold(
      (failure) => emit(state.requestFailure(failure)),
      (photosApiResponse) => emit(state.requestSuccess(photosApiResponse)),
    );
  }
}
