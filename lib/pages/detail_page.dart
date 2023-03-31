import 'package:flutter/material.dart';
import 'package:my_library/easy_widgets/easy_text_widget.dart';

import '../constants/dimens.dart';
import '../easy_widgets/easy_cached_network_image.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key,required this.title,required this.img}) : super(key: key);

  final String title;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: EasyTextWidget(text: title,fontSize: kFZ20,color: Colors.white,),
      ) ,
      body:ListView(
        children: [
        Card(
        elevation: 5,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: kSP20x),
          width: double.infinity,
          height: searchResultBookHeight,
          child: Row(
            children: [
              SizedBox(
                width: searchResultBookWidth,
                height: double.infinity,
                child: ClipRRect(borderRadius: BorderRadius.circular(kSP10x),child: EasyCachedNetworkImage(img:img)),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(kSP10x),
                child: EasyTextWidget(text:title,fontSize: kFZ20,color: Colors.white,maxLines: 6,),
              ))
            ],
          ),
        ),
      )
        ],
      ),
    );
  }
}
