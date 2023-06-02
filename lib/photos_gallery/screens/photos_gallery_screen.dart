import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffarha_challenge/photos_gallery/screens/widgets/failure_widget_handler.dart';
import 'package:waffarha_challenge/photos_gallery/screens/widgets/image_item_widget.dart';
import 'package:waffarha_challenge/photos_gallery/screens/widgets/loading_shimmer_widget.dart';

import '../logic/cubit/photos_cubit.dart';

class PhotosGalleryScreen extends StatefulWidget {
  const PhotosGalleryScreen({super.key});

  @override
  State<PhotosGalleryScreen> createState() => _PhotosGalleryScreenState();
}

class _PhotosGalleryScreenState extends State<PhotosGalleryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PhotosGalleryCubit>().getPhotosList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotosGalleryCubit, PhotosGalleryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
              ? ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) => const LoadingShimmerWidget(),
                )
              : state.photosApiResponse != null
                  ? ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount:
                          state.photosApiResponse?.photosList.length ?? 0,
                      itemBuilder: (context, index) => PhotoListItem(
                        photoItemModel:
                            state.photosApiResponse!.photosList[index],
                      ),
                    )
                  : FailurePlaceHolderWidget(
                      failure: state.failure!,
                    ),
        );
      },
    );
  }
}
