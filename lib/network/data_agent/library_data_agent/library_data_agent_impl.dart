import 'package:dio/dio.dart';
import 'package:my_library/constants/api_constants.dart';
import 'package:my_library/data/vos/search_vo/items_vo/items_vo.dart';
import 'package:my_library/network/api/home_screen_api/home_screen_api.dart';
import 'package:my_library/network/data_agent/library_data_agent/library_data_agent.dart';

import '../../../data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import '../../api/search_api/search_api.dart';

class LibraryDataAgentImpl extends LibraryDataAgent{
  late HomeScreenApi _homeScreenApi;
  late SearchApi _searchApi;
  LibraryDataAgentImpl._(){
    final dio=Dio();
    _homeScreenApi=HomeScreenApi(dio);
    _searchApi=SearchApi(dio);
  }
  static final _singleton=LibraryDataAgentImpl._();
  factory LibraryDataAgentImpl()=>_singleton;

  @override
  Future<List<BooksListsVO>?> getOverviewBooks()=>_homeScreenApi
      .getOverviewBooks(kPublishedDate, kApiKey)
      .asStream()
      .map((event) => event.results?.lists)
      .first;

  @override
  Future<List<ItemsVO>?> getSearchItems(String searchItem)=>_searchApi
      .getSearchBooks(searchItem)
      .asStream()
      .map((event) => event.items)
      .first;

}