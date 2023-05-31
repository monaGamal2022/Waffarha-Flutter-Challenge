part of 'photos_cubit.dart';

class PhotosGalleryState {
  final bool isLoading;
  final PhotosApiResponseModel? photosApiResponse;
  final Failure? failure;

  const PhotosGalleryState({
    this.isLoading = true,
    this.failure,
    this.photosApiResponse,
  });

  PhotosGalleryState requestSuccess(PhotosApiResponseModel photosApiResponse) {
    return copyWith(
      isLoading: false,
      failure: Nullable(null),
      photosApiResponse: photosApiResponse,
    );
  }

  PhotosGalleryState requestFailure(Failure failure) {
    return copyWith(
      isLoading: false,
      failure: Nullable(failure),
    );
  }

  PhotosGalleryState copyWith(
      {bool? isLoading,
      PhotosApiResponseModel? photosApiResponse,
      Nullable<Failure?>? failure}) {
    return PhotosGalleryState(
      isLoading: isLoading ?? this.isLoading,
      photosApiResponse: photosApiResponse ?? this.photosApiResponse,
      failure: failure == null ? this.failure : failure.value,
    );
  }
}
