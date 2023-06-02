part of 'photos_cubit.dart';

class PhotosGalleryState {
  final bool isLoading;
  final String? sortBy;
  final bool isPaginating;
  final List<PhotoItemModel>? photosList;
  final int startOfTheCurrentPage;
  final Failure? failure;

  const PhotosGalleryState({
    this.isLoading = false,
    this.isPaginating = false,
    this.failure,
    this.sortBy,
    this.startOfTheCurrentPage = 0,
    this.photosList,
  });

  PhotosGalleryState requestFailure(Failure failure) {
    return copyWith(
      isLoading: false,
      failure: Nullable(failure),
    );
  }

  PhotosGalleryState copyWith(
      {bool? isLoading,
      bool? isPaginating,
      int? startOfTheCurrentPage,
      List<PhotoItemModel>? photosList,
      Nullable<String?>? sortBy,
      Nullable<Failure?>? failure}) {
    return PhotosGalleryState(
      isPaginating: isPaginating ?? this.isPaginating,
      startOfTheCurrentPage:
          startOfTheCurrentPage ?? this.startOfTheCurrentPage,
      isLoading: isLoading ?? this.isLoading,
      sortBy: sortBy == null ? this.sortBy : sortBy.value,
      photosList: photosList ?? this.photosList,
      failure: failure == null ? this.failure : failure.value,
    );
  }
}
