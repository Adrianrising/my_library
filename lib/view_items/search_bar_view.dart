import 'package:flutter/material.dart';

import '../constants/String.dart';
import '../constants/dimens.dart';
import '../easy_widgets/easy_text_widget.dart';

class SearchBarView extends StatelessWidget {
  const SearchBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      backgroundColor: Colors.transparent,
      floating: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kSP20x),
          child: Card(
            elevation: searchBarElevation,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kSP10x)),
            margin: const EdgeInsets.symmetric(horizontal: kSP20x),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                  const EasyTextWidget(
                    text: kSearchPlayBooksText,
                    fontSize: kFZ17,
                  ),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(kUserImage),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}