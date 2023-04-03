import 'package:flutter/cupertino.dart';
import 'package:my_library/data/apply/library_apply.dart';
import 'package:my_library/data/apply/library_apply_impl.dart';
import 'package:my_library/data/vos/search_history_vo/search_history_vo.dart';
import 'package:my_library/utils/debouncer_utils.dart';

import '../data/vos/search_vo/items_vo/items_vo.dart';

class SearchPageBloc extends ChangeNotifier{
  ///////////////////////////////////////////////
  ///////////////// instances //////////////////
  ///////////////////////////////////////////////
  final LibraryApply _libraryApply=LibraryApplyImpl();
  final TextEditingController _textEditingController=TextEditingController();
  final Debouncer _debouncer=Debouncer(milliseconds: 1000);

  ///////////////////////////////////////////////
  ///////////////// attributes //////////////////
  ///////////////////////////////////////////////
  bool _dispose=false;

  List<ItemsVO> ? _searchItems=[];


  List<SearchHistoryVO> ? _searchHistory=[];

  bool _isSearching=false;

  ///////////////////////////////////////////////
  ///////////////// getters //////////////////
  ///////////////////////////////////////////////
  List<ItemsVO> ? get getSearchItems=>_searchItems;


  Debouncer get getDebouncer=>_debouncer;


  List<SearchHistoryVO> ? get getSearchHistory=>_searchHistory;

  TextEditingController get getTextController=>_textEditingController;

  bool get getIsSearching=>_isSearching;

  ///////////////////////////////////////////////
  ///////////////// methods //////////////////
  ///////////////////////////////////////////////
  void getSearchItemFromNetwork(String searchItem,{bool ? isSubmitted}){
    _libraryApply.getSearchItemsFromNetwork(searchItem).then((value){
      _searchItems=value??[];
      if(isSubmitted==null){
        createSearchHistory(searchItem, searchItem);
      }
      notifyListeners();
    });
  }


  void searchHistoryToBox(SearchHistoryVO searchHistory)=>_libraryApply.searchHistoryToBox(searchHistory);

  void createSearchHistory(String searchTitle,String searchItems)=>_libraryApply.createSearchHistory(searchTitle, searchItems);

  void deleteSearchHistory(String searchTitle)=>_libraryApply.deleteSearchHistory(searchTitle);

  void changeIsSearchingValue() {
    _isSearching = _textEditingController.text.isNotEmpty;
    notifyListeners();
  }

  ///////////////////////////////////////////////
  ///////////////// constructor //////////////////
  ///////////////////////////////////////////////
  SearchPageBloc({String ? searchKeyword}){
    /////////////// if not null, moving to detail page
    if(searchKeyword!=null){
      getSearchItemFromNetwork(searchKeyword);
    }
    _libraryApply.searchHistoryFromBoxAsStream().listen((event) {
      final temp=event??[];
      _searchHistory=temp;
      notifyListeners();
    });
  }



  @override
  void notifyListeners() {
    if(!_dispose){
      super.notifyListeners();
    }
  }
  @override
  void dispose() {
    _dispose=true;
    _textEditingController.dispose();
    super.dispose();
  }
}