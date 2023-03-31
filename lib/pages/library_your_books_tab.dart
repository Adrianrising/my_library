import 'package:flutter/material.dart';
import 'package:my_library/bloc/e_books_your_books_bloc.dart';
import 'package:my_library/data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import 'package:my_library/easy_widgets/easy_text_widget.dart';
import 'package:my_library/utils/extension.dart';
import 'package:provider/provider.dart';
import '../constants/String.dart';
import '../constants/dimens.dart';
import '../easy_widgets/easy_book_list_horizontal_widget.dart';
import '../easy_widgets/easy_book_widget.dart';
import 'add_to_shelf_page.dart';
import 'shelves_tab.dart';

class LibraryYourBooksTab extends StatelessWidget {
  const LibraryYourBooksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EBooksYourBooksBloc>(
      create: (context) => EBooksYourBooksBloc(),
      builder: (context, child) {
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const SizedBox(
                height: kSP20x,
              ),
              const TabBar(
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    text: kYourBookText,
                  ),
                  Tab(
                    text:kShelvesText,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Selector<EBooksYourBooksBloc, List<BooksListsVO>?>(
                      selector: (_, obj) => obj.getFavBooksList,
                      builder: (context, favBooksList, child) {
                        return (favBooksList?.isEmpty ?? true)
                            ? Center(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width*0.8,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.book,
                                        size: kFZ90,
                                      ),
                                      const SizedBox(
                                        height: kSP20x,
                                      ),
                                      const EasyTextWidget(
                                        text: kStartYourCollectionText,
                                        fontSize: kFZ21,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        height: kSP20x,
                                      ),
                                      const EasyTextWidget(
                                        text:
                                        kDescriptionOne,
                                        color: Colors.grey,
                                      ),
                                      const EasyTextWidget(
                                        text:
                                        kDescriptionTwo,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        height: kSP20x,
                                      ),
                                      MaterialButton(
                                        color: Colors.blue,
                                        onPressed: () {
                                          context
                                              .getHomePageBlocInstance()
                                              .changeBottomNavBarIndex(0);
                                        },
                                        child: const EasyTextWidget(
                                          text: kShopForBooksText,
                                          fontSize: kFZ16,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: favBooksList?.length ?? 0,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: kSP30x,
                                ),
                                itemBuilder: (context, listIndex) {
                                  return SizedBox(
                                    height: overviewBooksSectionHeight,
                                    child: EasyBookListHorizontalWidget(
                                      bookListName: favBooksList?[listIndex]
                                              .displayName ??
                                          '',
                                      bookListLength: favBooksList?[listIndex]
                                              .books
                                              ?.length ??
                                          0,
                                      itemCount: favBooksList?[listIndex]
                                              .books
                                              ?.length ??
                                          0,
                                      itemBuilder: (_, booksIndex) {
                                        return EasyBookWidget(
                                          bookImage: favBooksList?[listIndex]
                                                  .books?[booksIndex]
                                                  .bookImage ??
                                              '',
                                          bookListName: favBooksList?[listIndex]
                                                  .displayName ??
                                              '',
                                          bookTitle: favBooksList?[listIndex]
                                                  .books?[booksIndex]
                                                  .title ??
                                              '',
                                          isFavorite: favBooksList?[listIndex]
                                                  .books?[booksIndex]
                                                  .isFavorite ??
                                              false,
                                          onPressedFavIcon: () {
                                            context
                                                .getShopBooksPageBlocInstance()
                                                .changeFavoriteBookValue(
                                                    favBooksList?[listIndex]
                                                            .listId ??
                                                        -1,
                                                    favBooksList?[listIndex]
                                                            .books?[booksIndex]
                                                            .bookIndex ??
                                                        -1);
                                          },
                                          onTapAddToShelf: (){
                                            context.navigateToNextScreen(context,  AddToShelfPage(book:favBooksList![listIndex].books![booksIndex],));
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                      },
                    ),
                    const ShelvesTab()
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


