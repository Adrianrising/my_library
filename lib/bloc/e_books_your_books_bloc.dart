import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_library/apply/library_apply_impl.dart';

import '../apply/library_apply.dart';
import '../data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import '../data/vos/home_screen_vo/books_vo/books_vo.dart';

class EBooksYourBooksBloc extends ChangeNotifier {
  ///////////////////////////////////////////////
  ///////////////// instance ////////////////////
  ///////////////////////////////////////////////
  final LibraryApply _apply = LibraryApplyImpl();

  ///////////////////////////////////////////////
  ///////////////// attributes //////////////////
  ///////////////////////////////////////////////
  bool _dispose = false;
  bool _isFavorite = false;
  List<BooksListsVO>? _overviewBooks = [];
  List<BooksVO>  _favBooks=[];
  List<BooksListsVO>? _favBookList = [];

  ///////////////////////////////////////////////
  ///////////////// getters //////////////////
  ///////////////////////////////////////////////
  bool get getIsFavorite => _isFavorite;

  List<BooksListsVO>? get getOverviewBooks => _overviewBooks;

  List<BooksListsVO>? get getFavBooksList => _favBookList;

  List<BooksVO> ? get getFavBooks=>_favBooks;

  ///////////////////////////////////////////////
  ///////////////// methods ////////////////////
  ///////////////////////////////////////////////
  void changeIsFavorite(bool favValue) {
    _isFavorite = favValue;
    notifyListeners();
  }

  void changeFavoriteBookValue(int id, int bookIndex) {
    _apply.changeIsFavoriteValueInOverviewBox(id, bookIndex);
  }

  EBooksYourBooksBloc() {
    _apply.getOverviewBooksFromNetwork();
    _apply.overviewBooksFromBoxAsStream().listen((event) {
      _favBooks.clear();
      final temp = event ?? [];
      _overviewBooks = temp;
      //deep copy data from database
      _favBookList = List<BooksListsVO>.from(
          (jsonDecode(jsonEncode(event ?? [])) as List<dynamic>)
              .map((e) => BooksListsVO.fromJson(e)));


      // filter the result
      _favBookList = _favBookList
              ?.where((element) => element.containsFavoriteBook ?? false)
              .toList() ??
          [];
      // filter books
      if (_favBookList != null) {
        for (var element in _favBookList!) {
          List<BooksVO> favBooks = element.books
                  ?.where((element) => element.isFavorite ?? false)
                  .toList() ??
              [];
          element.books = favBooks;
          _favBooks.addAll(favBooks??[]);
          _favBooks=_favBooks.map((e) => e).toList();
        }
      }
      _favBooks.sort((a,b)=>b.dateTime?.compareTo(a.dateTime!)??0);

      // _favBooks=_favBookList?.map((e) => e.books?.where((element) => element.isFavorite??true).toList()).expand((element) => element??[]).cast<BooksVO>().toList();
      notifyListeners();
    });
  }

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _dispose = true;
    super.dispose();
  }
}
