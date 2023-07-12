import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheNetworkImage extends StatelessWidget {
  const CacheNetworkImage({
    super.key,
    required this.url,
    this.borderRadius = 10,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  });
  final String? url;
  final double borderRadius;
  final BoxFit? fit;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url!,
      width: width,
      height: height,
      fit: fit,
      progressIndicatorBuilder:
          (context, String url, DownloadProgress progress) {
        print("progress.:${progress.totalSize}");
        return Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      },
    );
    /* return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        fit: fit,
        height: height,
        width: width,
        url ?? "",
        errorBuilder: (BuildContext context, _, stackTrace) {
          return Center(
              child: Text(
            S.of(context).imageNotLoaded,
          ));
        },
        loadingBuilder: (context, Widget child, ImageChunkEvent? url) {
          if (url == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                value: url.expectedTotalBytes != null
                    ? url.cumulativeBytesLoaded / url.expectedTotalBytes!
                    : null,
              ),
            );
          }
        },
      ),
    );
  */
  }
}
