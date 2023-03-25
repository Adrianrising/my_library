import '../../../data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';

import '../../../data/vos/search_vo/items_vo/items_vo.dart';

abstract class LibraryDataAgent{
  Future<List<BooksListsVO>?> getOverviewBooks();
  Future<List<ItemsVO>?> getSearchItems();
}