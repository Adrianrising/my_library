import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EasyCachedNetworkImage extends StatelessWidget {
  const EasyCachedNetworkImage({Key? key,
    required this.img,
    this.width,
    this.height,
  }) : super(key: key);
  final String img;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: BoxFit.cover,
      imageUrl: img,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
