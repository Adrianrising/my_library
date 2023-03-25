import 'package:flutter/material.dart';
import 'package:my_library/bloc/shop_books_page_bloc.dart';
import 'package:my_library/easy_widgets/easy_text_widget.dart';
import 'package:my_library/utils/extension.dart';
import 'package:provider/provider.dart';
import '../constants/dimens.dart';
import '../data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import '../easy_widgets/easy_cached_network_image.dart';

class EbooksTabView extends StatelessWidget {
  const EbooksTabView({
    super.key,
    required this.overviewBooks,
    required this.listIndex,
  });

  final int listIndex;
  final List<BooksListsVO>? overviewBooks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kSP10x, bottom: kSP10x),
          child: EasyTextWidget(
            text: overviewBooks?[listIndex].displayName ?? '',
            color: Colors.white,
            fontSize: kFZ18,
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: overviewBooks?[listIndex].books?.length ?? 0,
            itemBuilder: (context, booksIndex) {
              return Container(
                width: MediaQuery.of(context).size.width *
                    overviewBookScrollHeight,
                margin: const EdgeInsets.symmetric(horizontal: kSP10x),
                child: InkWell(
                  onLongPress: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            Card(
                              elevation: 5,
                              child: ListTile(
                                leading: EasyCachedNetworkImage(
                                    img: overviewBooks?[listIndex]
                                            .books?[booksIndex]
                                            .bookImage ??
                                        ''),
                                title: EasyTextWidget(
                                  text: overviewBooks?[listIndex]
                                          .books?[booksIndex]
                                          .title ??
                                      '',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                subtitle: EasyTextWidget(
                                  text:
                                      overviewBooks?[listIndex].listName ?? '',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const ListTile(
                              leading: Icon(Icons.remove_circle),
                              title: EasyTextWidget(
                                text: 'Remove Download',
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            const ListTile(
                              leading: Icon(Icons.delete),
                              title: EasyTextWidget(
                                text: 'Delete From Library',
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            const ListTile(
                              leading: Icon(Icons.add),
                              title: EasyTextWidget(
                                text: 'Add to Shelf',
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kSP10x),
                        child: Stack(children: [
                          EasyCachedNetworkImage(
                            img: overviewBooks?[listIndex]
                                    .books?[booksIndex]
                                    .bookImage ??
                                '',
                            height: overviewBookHeight,
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: IconButton(
                                onPressed: () {
                                  context
                                      .getShopBooksPageBlocInstance()
                                      .changeIsFavorite();
                                  context
                                      .getShopBooksPageBlocInstance()
                                      .changeFavoriteBookValue(
                                          overviewBooks?[listIndex].listId ??
                                              -1,
                                          booksIndex);
                                },
                                icon: Selector<ShopBooksPageBloc, bool>(
                                  selector: (_, obj) => obj.getIsFavorite,
                                  builder: (context, isFavorite, child) {
                                    return (isFavorite)
                                        ? const Icon(
                                            Icons.favorite_outline,
                                            size: 35,
                                      color: Colors.red,
                                    )
                                        : const Icon(
                                            Icons.favorite_outline,
                                            size: 35,
                                          );
                                  },
                                )),
                          )
                        ]),
                      ),
                      EasyTextWidget(
                        text: overviewBooks?[listIndex]
                                .books?[booksIndex]
                                .title ??
                            '',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
