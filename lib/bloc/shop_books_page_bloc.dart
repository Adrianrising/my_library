import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_library/apply/library_apply_impl.dart';

import '../apply/library_apply.dart';
import '../data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import '../data/vos/home_screen_vo/books_vo/books_vo.dart';

class ShopBooksPageBloc extends ChangeNotifier{
  ///////////////////////////////////////////////
  ///////////////// instance ////////////////////
  ///////////////////////////////////////////////
  final LibraryApply _apply=LibraryApplyImpl();
  ///////////////////////////////////////////////
  ///////////////// attributes //////////////////
  ///////////////////////////////////////////////
  bool _dispose=false;
  bool _isFavorite=false;
  List<BooksListsVO>? _overviewBooks=[];
  // List<BooksVO> ? _favoriteBooks=[];

  List<BooksListsVO> _favBookList=[];


  ///////////////////////////////////////////////
  ///////////////// getters //////////////////
  ///////////////////////////////////////////////
  bool get getIsFavorite=>_isFavorite;
  List<BooksListsVO>? get getOverviewBooks=>_overviewBooks;
  // List<BooksVO>? get getFavoriteBooks=>_favoriteBooks;

  ///////////////////////////////////////////////
  ///////////////// methods ////////////////////
  ///////////////////////////////////////////////
  void changeIsFavorite(){
    _isFavorite=!_isFavorite;
    notifyListeners();
  }
  void changeFavoriteBookValue(int id, int bookIndex){
    _apply.changeIsFavoriteValue(id, bookIndex);
  }

  ShopBooksPageBloc(){
    _apply.getOverviewBooksFromNetwork();
    _apply.overviewBooksFromBoxAsStream().listen((event) {
      final temp=event??[];
      _overviewBooks=temp;
      // _favoriteBooks=temp.map((e) => e.books?.where((element) => element.isFavorite??true).toList()).expand((element) => element??[]).cast<BooksVO>().toList();
      // _favBookList = temp.where((element) => element.books?.any((book) => book.isFavorite ?? false) ?? false).toList();
      // _favBookList = temp.where((element) => element.books?.where((book) => book.isFavorite ?? false).isNotEmpty ?? false).toList();
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
    super.dispose();
  }
}