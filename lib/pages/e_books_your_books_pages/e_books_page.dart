import 'package:flutter/material.dart';
import 'package:my_library/pages/detail_page.dart';
import 'package:my_library/pages/shelves_pages/add_to_shelf_page.dart';
import 'package:my_library/utils/extension.dart';
import 'package:provider/provider.dart';
import '../../bloc/e_books_your_books_bloc.dart';
import '../../constants/string.dart';
import '../../constants/dimens.dart';
import '../../data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import '../../easy_widgets/easy_book_list_horizontal_widget.dart';
import '../../easy_widgets/easy_book_widget.dart';
import '../../view_items/carousel_slider_view.dart';

class ShopBooksPage extends StatelessWidget {
  const ShopBooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EBooksYourBooksBloc>(
      create: (context) => EBooksYourBooksBloc(),
      builder: (context, child) => DefaultTabController(
        length: tabBarLength,
        child: ListView(scrollDirection: Axis.vertical, children: [
          const SizedBox(height: kSP20x),
          const CarouselSliderView(),
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
          const SizedBox(height: kSP20x),
          Selector<EBooksYourBooksBloc, List<BooksListsVO>?>(
              selector: (context, obj) => obj.getOverviewBooks,
              shouldRebuild: (pre, next) => pre != next,
              builder: (context, overviewBooks, _) {
                int size = overviewBooks?.length ?? 1;
                return SizedBox(
                  height: size * overviewBooksSectionHeight + (size) * kSP30x,
                  child: TabBarView(
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: overviewBooks?.length ?? 0,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: kSP30x,
                        ),
                        itemBuilder: (context, listIndex) {
                          return SizedBox(
                            height: overviewBooksSectionHeight,
                            child: EasyBookListHorizontalWidget(
                              bookListName:
                                  overviewBooks?[listIndex].displayName ?? '',
                              bookListLength:
                                  overviewBooks?[listIndex].books?.length ?? 0,
                              itemCount:
                                  overviewBooks?[listIndex].books?.length ?? 0,
                              itemBuilder: (_, booksIndex) {
                                return EasyBookWidget(
                                  bookImage: overviewBooks?[listIndex]
                                          .books?[booksIndex]
                                          .bookImage ??
                                      '',
                                  bookListName:
                                      overviewBooks?[listIndex].displayName ??
                                          '',
                                  bookTitle: overviewBooks?[listIndex]
                                          .books?[booksIndex]
                                          .title ??
                                      '',
                                  isFavorite: overviewBooks?[listIndex]
                                          .books?[booksIndex]
                                          .isFavorite ??
                                      false,
                                  onPressedFavIcon: () {
                                    overviewBooks?[listIndex]
                                        .books?[booksIndex]
                                        .bookIndex = booksIndex;
                                    context
                                        .getEbooksYourBooksPageBlocInstance()
                                        .changeFavoriteBookValue(
                                            overviewBooks?[listIndex].listId ??
                                                -1,
                                            booksIndex);
                                  },
                                  onTapAddToShelf: () {
                                    context.navigateToNextScreen(
                                        context,
                                        AddToShelfPage(
                                          book: overviewBooks![listIndex]
                                              .books![booksIndex],
                                        ));
                                  },
                                  onTap: () {
                                    context.navigateToNextScreen(
                                        context,
                                        DetailPage(
                                            title: overviewBooks?[listIndex]
                                                    .books?[booksIndex]
                                                    .title ??
                                                '',
                                            img: overviewBooks?[listIndex]
                                                    .books?[booksIndex]
                                                    .bookImage ??
                                                ''));
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                      Container(),
                    ],
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
