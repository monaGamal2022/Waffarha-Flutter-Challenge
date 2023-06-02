import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/photo_item_model.dart';

class PhotoListItem extends StatelessWidget {
  final PhotoItemModel photoItemModel;

  const PhotoListItem({super.key, required this.photoItemModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoItemWidget(imageUrl: photoItemModel.url),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              Text(photoItemModel.title),
              const SizedBox(height: 8),
              Text(photoItemModel.thumbnailUrl),
              const SizedBox(height: 8),
              Text(photoItemModel.albumId),
            ],
          ),
        ),
      ],
    );
  }
}

class PhotoItemWidget extends StatelessWidget {
  final String imageUrl;
  const PhotoItemWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: CircularProgressIndicator(
            value: progress.progress,
          ),
        ),
        imageUrl: imageUrl,
      ),
    );
  }
}
