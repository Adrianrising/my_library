import 'package:my_library/data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';

import '../data/vos/search_vo/items_vo/items_vo.dart';

abstract class LibraryApply{
  Future<List<BooksListsVO>?> getOverviewBooksFromNetwork();

  Future<List<ItemsVO>?> getSearchItemsFromNetwork();

  void overviewBooksToBox(List<BooksListsVO> bookLists);

  void clearOverviewBox();

  Stream<List<BooksListsVO>?> overviewBooksFromBoxAsStream();

  void changeIsFavoriteValue(int id,int bookIndex);


}