import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffarha_challenge/core/api_manager.dart';
import 'package:waffarha_challenge/core/utils/nullable.dart';
import 'package:waffarha_challenge/photos_gallery/data/requests/get_phots_request.dart';

import '../../data/models/photo_item_model.dart';
import '../../data/repository/photos_repository.dart';

part 'photos_state.dart';

enum SortBy { albumId, title }

const limitPP = 10;

class PhotosGalleryCubit extends Cubit<PhotosGalleryState> {
  final PhotosRepository _photosRepository;

  PhotosGalleryCubit(this._photosRepository)
      : super(const PhotosGalleryState());

  Future<void> getPhotosList({
    int start = 0,
    String? sortBy,
    bool isPaginating = false,
    bool isLoading = true,
  }) async {
    emit(
      state.copyWith(
        isLoading: isLoading,
        isPaginating: isPaginating,
        startOfTheCurrentPage: start,
        sortBy: Nullable(sortBy),
      ),
    );

    final GetPhotosRequest request = GetPhotosRequest(
      start: start,
      limitPP: limitPP,
      sortBy: sortBy,
    );

    final result = await _photosRepository.getPhotosList(request: request);
    result.fold(
      (failure) => emit(state.requestFailure(failure)),
      (photosApiResponse) async {
        final ls = await photosApiResponse;

        List<PhotoItemModel> list = [];
        if (isLoading) list = List.from(ls.photosList);

        if (isPaginating) {
          list = List.from(state.photosList!);
          list.addAll(ls.photosList);
        }

        emit(
          state.copyWith(
            isPaginating: false,
            photosList: list,
            isLoading: false,
            sortBy: Nullable(sortBy),
            failure: Nullable(null),
            startOfTheCurrentPage: start,
          ),
        );
        if (kDebugMode) {
          print("view now has ${list.length}");
        }
      },
    );
  }

  resetFilter() {
    getPhotosList(
      isLoading: true,
      sortBy: null,
    );
  }

/*
  Future<void> sortPhotosListBy({
    int start = 0,
    int limit = 10,
    required String sortBy,
  }) async {
    emit(state.copyWith(isLoading: true));

    final GetPhotosRequest request =
        GetPhotosRequest(start: start, limitPP: limit, sortBy: sortBy);

    final result = await _photosRepository.getPhotosList(request: request);
    result.fold(
      (failure) => emit(state.requestFailure(failure)),
      (photosApiResponse) async {
        final ls = await photosApiResponse;
        final List<PhotoItemModel> list =
            state.photosList != null ? List.from(state.photosList!) : [];
        list.addAll(ls.photosList);
        emit(
          state.copyWith(
            isPaginating: false,
            photosList: list,
            isLoading: false,
            failure: Nullable(null),
            startOfTheCurrentPage: start,
          ),
        );
      },
    );
  }
*/
  int get startOfTheCurrentPage => state.startOfTheCurrentPage;
}
