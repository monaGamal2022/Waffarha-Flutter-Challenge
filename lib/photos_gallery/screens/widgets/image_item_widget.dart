import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/models/photo_item_model.dart';

class PhotoListItem extends StatelessWidget {
  final PhotoItemModel photoItemModel;
  final int index;

  const PhotoListItem({
    super.key,
    required this.photoItemModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PhotoItemWidget(imageUrl: photoItemModel.url),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: Card(
              elevation: 3,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _InfoBuilder(
                        infoKey: "Photo Title", value: photoItemModel.title),
                    const SizedBox(height: 8),
                    _InfoBuilder(
                        infoKey: "Photo thumbnailUrl",
                        value: photoItemModel.thumbnailUrl),
                    Visibility(
                      visible: false,
                      child: _InfoBuilder(
                        infoKey: "IIIIndex",
                        value: index.toString(),
                      ),
                    ),
                    Visibility(
                      visible: false,
                      child: _InfoBuilder(
                        infoKey: "IDDDD",
                        value: photoItemModel.id.toString(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    _InfoBuilder(
                      infoKey: "Photo album Id",
                      value: photoItemModel.albumId,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoBuilder extends StatelessWidget {
  const _InfoBuilder({
    super.key,
    required this.infoKey,
    required this.value,
  });

  final String infoKey;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$infoKey: ", style: const TextStyle(fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(
            value,
            softWrap: true,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
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
