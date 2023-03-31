import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_library/utils/assets_images_util.dart';
import 'package:my_library/utils/extension.dart';

class EasyCachedNetworkImage extends StatelessWidget {
  const EasyCachedNetworkImage({Key? key,
    required this.img,
    this.width,
    this.height,
    this.fit=BoxFit.cover
  }) : super(key: key);
  final String img;
  final double? width;
  final double? height;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: img.nullDefaultImage(),
      placeholder: (context, url) => Image.asset(AssetsImagesUtil.kMyLibraryPlaceHolder,fit: fit,),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
