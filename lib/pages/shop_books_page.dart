import 'package:flutter/material.dart';
import 'package:my_library/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc/shop_books_page_bloc.dart';
import '../constants/String.dart';
import '../constants/dimens.dart';
import '../data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import '../easy_widgets/easy_text_widget.dart';
import '../view_items/e_books_tab_view.dart';

class ShopBooksPage extends StatelessWidget{
  const ShopBooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShopBooksPageBloc>(
      create: (context) => ShopBooksPageBloc(),
      builder: (context, child) => DefaultTabController(
        length: tabBarLength,
        child: Column(
          children: [
            const SizedBox(height: kSP20x),
            const TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  text: kEbooksText,
                ),
                Tab(
                  text: kAudiobooksText,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Selector<ShopBooksPageBloc, List<BooksListsVO>?>(
                      selector: (context, obj) => obj.getOverviewBooks,
                      shouldRebuild: (pre,next)=>pre!=next,
                      builder: (context, overviewBooks, _) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              for (int listIndex = 0,listLength = overviewBooks?.length ?? 0; listIndex<listLength;listIndex++)
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: kSP20x),
                                  height:overviewBooksSectionHeight,
                                  child: EbooksTabView(listIndex: listIndex,overviewBooks: overviewBooks),
                                )
                            ],
                          ),
                        );
                      }),
                  const Center(child: EasyTextWidget(text:'Audiobooks',),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
