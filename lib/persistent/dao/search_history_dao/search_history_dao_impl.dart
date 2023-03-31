import 'package:hive/hive.dart';
import 'package:my_library/data/vos/search_history_vo/search_history_vo.dart';
import 'package:my_library/persistent/dao/search_history_dao/search_history_dao.dart';

import '../../../constants/hive_constants.dart';

class SearchHistoryDAOImpl extends SearchHistoryDAO{
  SearchHistoryDAOImpl._();
  static final _singleton=SearchHistoryDAOImpl._();
  factory SearchHistoryDAOImpl()=>_singleton;

  Box<SearchHistoryVO> _getSearchHistoryBox()=>Hive.box<SearchHistoryVO>(kSearchHistoryBoxName);

  @override
  void clearSearchHistoryBox()=>_getSearchHistoryBox().clear();


  @override
  void searchHistoryToBox(SearchHistoryVO searchHistory){
    _getSearchHistoryBox().put(searchHistory.searchTitle, searchHistory);
  }

  @override
  Stream watchBox()=>_getSearchHistoryBox().watch();

  @override
  List<SearchHistoryVO>? searchHistoryFromBox()=>_getSearchHistoryBox().values.toList();

  @override
  Stream<List<SearchHistoryVO>?>? searchHistoryFromBoxAsStream()=>Stream.value(searchHistoryFromBox());

  @override
  void createSearchHistory(String searchTitle, String item) {
    final temp=SearchHistoryVO(searchTitle, item);
    _getSearchHistoryBox().put(temp.searchTitle, temp);
  }

  @override
  void deleteSearchHistory(String searchTitle) {
    _getSearchHistoryBox().delete(searchTitle);
  }


}