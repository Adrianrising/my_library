import 'package:flutter/material.dart';

import '../constants/dimens.dart';
import 'easy_text_widget.dart';

class EasyListTileWidget extends StatelessWidget {
  const EasyListTileWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.leading,
    required this.onTapListTile,
    this.trailing,
  });

  final String title;
  final String subTitle;
  final Widget leading;
  final Function onTapListTile;
  final Widget ? trailing;



  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(vertical: kSP10x),
      child: ListTile(
        isThreeLine: true,
        title: EasyTextWidget(
          text: title,
          color: Colors.white,
          fontSize: kFZ20,
        ),
        leading:leading,
        subtitle: EasyTextWidget(
          text: subTitle,
          color: Colors.grey,
        ),
        onTap: () {
          onTapListTile();
        },
        trailing: trailing,
      ),
    );
  }
}