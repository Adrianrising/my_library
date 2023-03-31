import 'package:flutter/material.dart';
import 'package:my_library/easy_widgets/easy_text_widget.dart';
import '../constants/dimens.dart';

class EasyBookListHorizontalWidget extends StatelessWidget {
  const EasyBookListHorizontalWidget({
    super.key,
    required this.bookListName,
    required this.bookListLength,
    required this.itemBuilder,
    required this.itemCount
  });

  final String bookListName;
  final int bookListLength;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kSP10x, bottom: kSP10x),
          child: EasyTextWidget(
            text:bookListName,
            color: Colors.white,
            fontSize: kFZ18,
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bookListLength,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}
