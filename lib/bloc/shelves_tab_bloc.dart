import 'package:flutter/material.dart';
import 'package:my_library/apply/library_apply.dart';
import 'package:my_library/apply/library_apply_impl.dart';
import 'package:my_library/data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';

import '../data/vos/home_screen_vo/books_vo/books_vo.dart';
import '../data/vos/home_screen_vo/shelf_books_vo/shelf_books_vo.dart';
class ShelvesTabBloc extends ChangeNotifier{
  ///////////////////////////////////////////////
  ///////////////// instances //////////////////
  ///////////////////////////////////////////////
  final LibraryApply _libraryApply=LibraryApplyImpl();

  final TextEditingController _textEditingController=TextEditingController();

  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();

  ///////////////////////////////////////////////
  ///////////////// attributes //////////////////
  ///////////////////////////////////////////////
  bool  _dispose=false;
  List<ShelfBooksVO> _shelfBooksCollections=[];

  ShelfBooksVO ? _shelf;

  ///////////////////////////////////////////////
  ///////////////// getters //////////////////
  ///////////////////////////////////////////////
  GlobalKey<FormState> get getGlobalFormKey=>_globalKey;

  TextEditingController get getTextEditingController=>_textEditingController;

  List<ShelfBooksVO>  get getShelfBooksCollections=>_shelfBooksCollections;

  ShelfBooksVO ? get getShelf=>_shelf;



  ///////////////////////////////////////////////
  ///////////////// methods //////////////////
  ///////////////////////////////////////////////
  void createShelfBooks(String shelfName,{BooksVO ? book}) {
    if(book==null){
      _libraryApply.createShelfBooks(shelfName, book: book);
      return;
    }
    _libraryApply.createShelfBooks(shelfName, book: book);
    notifyListeners();
  }

  void deleteShelfBook(String shelfName,BooksVO ? book) {
    _libraryApply.deleteShelfBook(shelfName, book);
  }

  void deleteShelf(String shelfName)=>_libraryApply.deleteShelf(shelfName);



  ///////////////////////////////////////////////
  ///////////////// constructor //////////////////
  ///////////////////////////////////////////////
  ShelvesTabBloc({ShelfBooksVO ? shelf}){
    if(shelf!=null){
      _shelf=shelf;
    }
    _libraryApply.shelfBooksFromBoxAsStream().listen((event) {
      final temp=event??[];
      _shelfBooksCollections=temp;
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