import 'package:my_library/data/vos/search_history_vo/search_history_vo.dart';
import 'package:my_library/data/vos/search_vo/items_vo/items_vo.dart';

abstract class SearchHistoryDAO{
  void searchHistoryToBox(SearchHistoryVO searchHistory);

  List<SearchHistoryVO>?  searchHistoryFromBox();

  Stream<List<SearchHistoryVO>?> ? searchHistoryFromBoxAsStream();

  void clearSearchHistoryBox();

  Stream watchBox();

  void createSearchHistory(String searchTitle,String item);

  void deleteSearchHistory(String searchTitle);

}