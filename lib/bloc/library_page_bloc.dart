import 'package:flutter/foundation.dart';
import 'package:my_library/apply/library_apply.dart';
import 'package:my_library/apply/library_apply_impl.dart';

import '../data/vos/home_screen_vo/books_vo/books_vo.dart';

class LibraryPageBloc extends ChangeNotifier{
  ///////////////////////////////////////////////
  ///////////////// instances //////////////////
  ///////////////////////////////////////////////
  final LibraryApply _libraryApply=LibraryApplyImpl();

  ///////////////////////////////////////////////
  ///////////////// attributes //////////////////
  ///////////////////////////////////////////////
  List<BooksVO> ? _favoriteBooks=[];

  ///////////////////////////////////////////////
  ///////////////// getters //////////////////
  ///////////////////////////////////////////////
  List<BooksVO>? get getFavoriteBooks=>_favoriteBooks;

  ///////////////////////////////////////////////
  ///////////////// methods //////////////////
  ///////////////////////////////////////////////
  void changeFavoriteBookValue(int id, int bookIndex){
    _libraryApply.changeIsFavoriteValue(id, bookIndex);
  }


  LibraryPageBloc(){
    _libraryApply.overviewBooksFromBoxAsStream().listen((event) {
      final temp=event??[];
      _favoriteBooks=temp.map((e) => e.books?.map((e) => e).where((element) => element.isFavorite??true).toList()).first;
    });
  }
}