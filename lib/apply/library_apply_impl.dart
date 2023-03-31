import 'dart:convert';
import 'package:my_library/apply/library_apply.dart';
import 'package:my_library/data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import 'package:my_library/data/vos/home_screen_vo/books_vo/books_vo.dart';
import 'package:my_library/data/vos/home_screen_vo/shelf_books_vo/shelf_books_vo.dart';
import 'package:my_library/data/vos/search_history_vo/search_history_vo.dart';
import 'package:my_library/data/vos/search_vo/items_vo/items_vo.dart';
import 'package:my_library/network/data_agent/library_data_agent/library_data_agent.dart';
import 'package:my_library/network/data_agent/library_data_agent/library_data_agent_impl.dart';
import 'package:my_library/persistent/dao/overview_dao/overview_dao.dart';
import 'package:my_library/persistent/dao/overview_dao/overview_dao_impl.dart';
import 'package:my_library/persistent/dao/search_history_dao/search_history_dao.dart';
import 'package:my_library/persistent/dao/search_history_dao/search_history_dao_impl.dart';
import 'package:my_library/persistent/dao/shelf_books_dao/shelf_books_dao_impl.dart';
import 'package:my_library/persistent/dao/shelf_books_dao/shelf_books_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class LibraryApplyImpl extends LibraryApply {
  LibraryApplyImpl._();

  static final _singleton = LibraryApplyImpl._();

  factory LibraryApplyImpl() => _singleton;

  final LibraryDataAgent _dataAgent = LibraryDataAgentImpl();
  final OverviewDAO _dao = OverviewDAOImpl();
  final ShelfBooksDAO _shelfDAO=ShelfBooksDAOImpl();
  final SearchHistoryDAO _searchHistoryDAO=SearchHistoryDAOImpl();

  @override
  Future<List<BooksListsVO>?> getOverviewBooksFromNetwork( ) =>
      _dataAgent.getOverviewBooks().then((value) {
        final temp = value ?? [];
        List<BooksListsVO>? favBookList=_dao.overviewBooksFromBox()?.where((element) => element.containsFavoriteBook??false).toList()??[];
        favBookList= List<BooksListsVO>.from((jsonDecode(jsonEncode(favBookList)) as List<dynamic>).map((e) => BooksListsVO.fromJson(e)));
        overviewBooksToBox(temp);
        overviewBooksToBox(favBookList);
        return temp;
      });

  @override
  Future<List<ItemsVO>?> getSearchItemsFromNetwork(String searchItem) =>
      _dataAgent.getSearchItems(searchItem).then((value) {
        final temp = value ?? [];
        return temp;
      });

  @override
  Stream<List<BooksListsVO>?> overviewBooksFromBoxAsStream() => _dao
      .watchBox()
      .startWith(_dao.overviewBooksFromBoxAsStream())
      .map((event) => _dao.overviewBooksFromBox());

  @override
  void overviewBooksToBox(List<BooksListsVO> bookLists) =>
      _dao.overviewBooksToBox(bookLists);

  @override
  void clearOverviewBox() => _dao.clearOverviewBox();

  @override
  void changeIsFavoriteValueInOverviewBox(int id, int bookIndex) =>
      _dao.changeIsFavoriteValueInOverviewBox(id, bookIndex);

  @override
  void clearShelfBox()=>_shelfDAO.clearShelfBox();

  @override
  Stream<List<ShelfBooksVO>?> shelfBooksFromBoxAsStream()=>_shelfDAO
      .watchBox()
      .startWith(_shelfDAO.shelfBooksFromBoxAsStream())
      .map((event) => _shelfDAO.shelfBooksFromBox());

  @override
  void shelfBooksToBox(ShelfBooksVO shelfBooksVO)=>_shelfDAO.shelfBooksToBox(shelfBooksVO);

  @override
  void createShelfBooks(String shelfName, {BooksVO? book})=>_shelfDAO.createShelfBooks(shelfName,book: book);

  @override
  void deleteShelfBook(String shelfName, BooksVO? book)=>_shelfDAO.deleteShelfBook(shelfName, book);

  @override
  void deleteShelf(String shelfName)=>_shelfDAO.deleteShelf(shelfName);

  @override
  void clearSearchHistoryBox()=>_searchHistoryDAO.clearSearchHistoryBox();

  @override
  Stream<List<SearchHistoryVO>?> searchHistoryFromBoxAsStream()=>_searchHistoryDAO
      .watchBox()
      .startWith(_searchHistoryDAO.searchHistoryFromBoxAsStream())
      .map((event) => _searchHistoryDAO.searchHistoryFromBox());

  @override
  void searchHistoryToBox(SearchHistoryVO searchHistory)=>_searchHistoryDAO.searchHistoryFromBox();

  @override
  void createSearchHistory(String searchTitle, String searchItems)=>_searchHistoryDAO.createSearchHistory(searchTitle, searchItems);

  @override
  void deleteSearchHistory(String searchTitle)=>_searchHistoryDAO.deleteSearchHistory(searchTitle);


}


