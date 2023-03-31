import 'package:flutter/material.dart';
import 'package:my_library/bloc/shelves_tab_bloc.dart';
import 'package:my_library/constants/dimens.dart';
import 'package:my_library/easy_widgets/easy_cached_network_image.dart';
import 'package:my_library/easy_widgets/easy_list_tile_leading_image_widget.dart';
import 'package:my_library/easy_widgets/easy_text_widget.dart';
import 'package:my_library/pages/detail_page.dart';
import 'package:my_library/utils/extension.dart';
import 'package:provider/provider.dart';

import '../../constants/String.dart';
import '../../data/vos/home_screen_vo/shelf_books_vo/shelf_books_vo.dart';

class ShelfBooksViewPage extends StatelessWidget {
  const ShelfBooksViewPage({Key? key, required this.shelf}) : super(key: key);

  final ShelfBooksVO shelf;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShelvesTabBloc>(
      create: (context) => ShelvesTabBloc(shelf: shelf),
      builder: (context, child) {
        return Selector<ShelvesTabBloc, ShelfBooksVO?>(
          selector: (_, obj) => obj.getShelf,
          shouldRebuild: (previous, next) => previous == next,
          builder: (context, shelf, _) {
            return Scaffold(
                appBar: AppBar(
                  actions: const [
                    Icon(
                      Icons.book,
                    ),
                    SizedBox(
                      width: kSP20x,
                    ),
                    Icon(Icons.search),
                    SizedBox(
                      width: kSP10x,
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(shelfBooksViewTitleHeight),
                    child: ListTile(
                      isThreeLine: true,
                      title: EasyTextWidget(
                        text: shelf?.shelfName ?? '',
                        color: Colors.white,
                        fontSize: kFZ30,
                      ),
                      subtitle: EasyTextWidget(
                        text: shelf?.books?.length.toString().checkCount() ??
                            kEmptyText,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                body: Selector<ShelvesTabBloc, ShelfBooksVO?>(
                  selector: (_, obj) => obj.getShelf,
                  shouldRebuild: (previous, next) => previous == next,
                  builder: (context, shelf, _) {
                    return (shelf?.books?.isEmpty ?? true)
                        ?Center(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.library_books,
                              size: kFZ90,
                            ),
                            EasyTextWidget(
                                text:kNoBooInTheCollectionText)
                          ],
                        ))
                        : ListView.builder(
                            itemCount: shelf?.books?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: kSP20x),
                                child: ListTile(
                                  title: EasyTextWidget(
                                    text: shelf?.books?[index].title ?? '',
                                    color: Colors.white,
                                  ),
                                  leading: EasyListTileLeadingImageWidget(
                                      imgWidget:EasyCachedNetworkImage(img: shelf?.books?[index].bookImage ?? '',fit: BoxFit.fill,)
                                          ),
                                  trailing: PopupMenuButton(
                                    position: PopupMenuPosition.over,
                                    onSelected: (selected) {
                                      if (selected == kDeleteText) {
                                        context
                                            .getShelvesTabBlocInstance()
                                            .deleteShelfBook(
                                                shelf?.shelfName ?? '',
                                                shelf?.books![index]);
                                      }
                                    },
                                    itemBuilder: (context) {
                                      return [
                                        const PopupMenuItem(
                                          value: kDeleteText,
                                          child: EasyTextWidget(text:kDeleteText),
                                        )
                                      ];
                                    },
                                  ),
                                  onTap: () {
                                    context.navigateToNextScreen(context, DetailPage(title: shelf?.books?[index].title ?? '', img: shelf?.books?[index].bookImage ?? ''));
                                  },
                                ),
                              );
                            },
                          );
                  },
                ));
          },
        );
      },
    );
  }
}

