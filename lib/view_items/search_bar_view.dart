import 'package:flutter/material.dart';
import 'package:my_library/utils/extension.dart';

import '../constants/string.dart';
import '../constants/dimens.dart';
import '../easy_widgets/easy_text_widget.dart';
import '../pages/search_pages/search_page.dart';

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
          child: GestureDetector(
            onTap: (){
              context.navigateToNextScreen(context,const SearchPage());
            },
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
                      color: Colors.white,
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(kUserImage),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}