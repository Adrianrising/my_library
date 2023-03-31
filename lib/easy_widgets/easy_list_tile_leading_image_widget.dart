import 'package:flutter/material.dart';

import '../constants/dimens.dart';
import 'easy_cached_network_image.dart';

class EasyListTileLeadingImageWidget extends StatelessWidget {
  const EasyListTileLeadingImageWidget({super.key, required this.imgWidget});

  final Widget imgWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kSP80x,
      child: Stack(children: [
        Positioned.fill(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(kSP10x),
              child:imgWidget ),
        ),
      ]),
    );
  }
}

//EasyCachedNetworkImage(fit: BoxFit.fill, img: img)