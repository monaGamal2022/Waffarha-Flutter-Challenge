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

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<PhotosGalleryCubit>().getPhotosList(
              start: context.read<PhotosGalleryCubit>().startOfTheCurrentPage,
            );

        controller.addListener(
          () {
            if (controller.position.pixels ==
                    controller.position.maxScrollExtent &&
                !context.read<PhotosGalleryCubit>().state.isPaginating) {
              context.read<PhotosGalleryCubit>().getPhotosList(
                    isLoading: false,
                    isPaginating: true,
                    sortBy: context.read<PhotosGalleryCubit>().state.sortBy,
                    start: (context
                            .read<PhotosGalleryCubit>()
                            .startOfTheCurrentPage +
                        limitPP),
                  );
            }
          },
        );
      },
    );
  }

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotosGalleryCubit, PhotosGalleryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              InkWell(
                onTap: () {
                  context.read<PhotosGalleryCubit>().resetFilter();
                },
                child: const Icon(
                  Icons.restart_alt_rounded,
                  color: Colors.orange,
                  size: 40,
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (bcontext) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 32),
                          const Text("Sort"),
                          const Divider(),
                          InkWell(
                            onTap: () {
                              Navigator.of(bcontext).pop();
                              context.read<PhotosGalleryCubit>().getPhotosList(
                                    sortBy: SortBy.title.name,
                                    isLoading: true,
                                    isPaginating: false,
                                    start: 0,
                                  );
                            },
                            child: const Text("Sort by photo title"),
                          ),
                          const Divider(),
                          InkWell(
                            onTap: () {
                              Navigator.of(bcontext).pop();

                              context.read<PhotosGalleryCubit>().getPhotosList(
                                    isLoading: true,
                                    isPaginating: false,
                                    start: 0,
                                    sortBy: SortBy.albumId.name,
                                  );
                            },
                            child: const Text("Sort by albumId"),
                          ),
                          const SizedBox(height: 32),
                        ],
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.orange,
                  size: 40,
                ),
              ),
              const SizedBox(width: 32),
            ],
          ),
          body: state.isLoading
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) =>
                        const LoadingShimmerWidget(),
                  ),
                )
              : state.photosList != null
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              controller: controller,
                              clipBehavior: Clip.none,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16),
                              itemCount: state.photosList?.length ?? 0,
                              itemBuilder: (context, index) => PhotoListItem(
                                photoItemModel: state.photosList![index],
                                index: index,
                              ),
                            ),
                          ),
                          BlocBuilder<PhotosGalleryCubit, PhotosGalleryState>(
                            builder: (context, st) {
                              return st.isPaginating
                                  ? const CircularProgressIndicator(
                                      color: Colors.orange,
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                    )
                  : FailurePlaceHolderWidget(
                      failure: state.failure,
                    ),
        );
      },
    );
  }
}
