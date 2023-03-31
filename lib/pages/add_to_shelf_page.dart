import 'package:flutter/material.dart';
import 'package:my_library/bloc/shelves_tab_bloc.dart';
import 'package:my_library/constants/String.dart';
import 'package:my_library/constants/dimens.dart';
import 'package:my_library/data/vos/home_screen_vo/books_vo/books_vo.dart';
import 'package:my_library/data/vos/home_screen_vo/shelf_books_vo/shelf_books_vo.dart';
import 'package:my_library/easy_widgets/easy_cached_network_image.dart';
import 'package:my_library/easy_widgets/easy_empty_list_widget.dart';
import 'package:my_library/easy_widgets/easy_list_tile_leading_image_widget.dart';
import 'package:my_library/easy_widgets/easy_list_tile_scrollable_widget.dart';
import 'package:my_library/easy_widgets/easy_text_widget.dart';
import 'package:my_library/utils/assets_images_util.dart';
import 'package:my_library/utils/extension.dart';
import 'package:provider/provider.dart';

import '../view_items/floating_action_button_extended_view.dart';

class AddToShelfPage extends StatelessWidget {
  const AddToShelfPage({Key? key, required this.book}) : super(key: key);

  final BooksVO book;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShelvesTabBloc(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const EasyTextWidget(
              text: kAddToShelfText,
              color: Colors.white,
              fontSize: kFZ25,
            ),
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back_ios,size: 30,),
            // ),
          ),
          body: Selector<ShelvesTabBloc, List<ShelfBooksVO>>(
            selector: (_, obj) => obj.getShelfBooksCollections,
            shouldRebuild: (previous, next) => previous != next,
            builder: (context, shelves, _) {
              return (shelves.isEmpty)
                  ? const EasyEmptyListWidget(
                      columnWidgets: [
                        Icon(
                          Icons.library_add,
                          size: kFZ90,
                        ),
                        SizedBox(
                          height: kSP20x,
                        ),
                        EasyTextWidget(
                          text: kNoShelfText,
                          color: Colors.white,
                        )
                      ],
                    )
                  : ListView.builder(
                      itemCount: shelves.length,
                      itemBuilder: (context, index) {
                        return EasyListTileWidget(
                          title: shelves[index].shelfName ?? '',
                          subTitle: shelves[index]
                                  .books
                                  ?.length
                                  .toString()
                                  .checkCount() ??
                              kEmptyText,
                          onTapListTile: () {
                            context
                                .getShelvesTabBlocInstance()
                                .createShelfBooks(
                                    shelves[index].shelfName ?? '',
                                    book: book);
                          },
                          leading: (shelves[index].books?.isEmpty ?? true)
                              ? EasyListTileLeadingImageWidget(
                                  imgWidget: Image.asset(
                                  AssetsImagesUtil.kShelfDefaultImage,
                                  fit: BoxFit.fill,
                                ))
                              : EasyListTileLeadingImageWidget(
                                  imgWidget: EasyCachedNetworkImage(
                                  img: shelves[index].books?.first.bookImage ??
                                      '',
                                  fit: BoxFit.fill,
                                )),
                        );
                      },
                    );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const FloatingActionButtonExtended(),
        );
      },
    );
  }
}
