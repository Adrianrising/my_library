import 'package:my_library/data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import 'package:my_library/data/vos/home_screen_vo/books_vo/books_vo.dart';

import '../data/vos/home_screen_vo/shelf_books_vo/shelf_books_vo.dart';
import '../data/vos/search_history_vo/search_history_vo.dart';
import '../data/vos/search_vo/items_vo/items_vo.dart';

abstract class LibraryApply{
  Future<List<BooksListsVO>?> getOverviewBooksFromNetwork();

  Future<List<ItemsVO>?> getSearchItemsFromNetwork(String searchItem);

  void overviewBooksToBox(List<BooksListsVO> bookLists);
  void shelfBooksToBox(ShelfBooksVO shelfBooksVO);
  void searchHistoryToBox(SearchHistoryVO searchHistory);


  Stream<List<BooksListsVO>?> overviewBooksFromBoxAsStream();
  Stream<List<ShelfBooksVO>?> shelfBooksFromBoxAsStream();
  Stream<List<SearchHistoryVO>?>  searchHistoryFromBoxAsStream();


  void clearOverviewBox();
  void clearShelfBox();
  void clearSearchHistoryBox();

  void changeIsFavoriteValueInOverviewBox(int id,int bookIndex);

  void createShelfBooks(String shelfName, {BooksVO? book});
  void createSearchHistory(String searchTitle,String searchItems);

  void deleteShelfBook(String shelfName,BooksVO ? book);
  void deleteShelf(String shelfName);
  void deleteSearchHistory(String searchTitle);



}