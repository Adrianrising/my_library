import 'package:hive/hive.dart';
import 'package:my_library/data/vos/home_screen_vo/books_vo/books_vo.dart';
import 'package:my_library/persistent/dao/shelf_books_dao/shelf_books_dao.dart';

import '../../../constants/hive_constants.dart';
import '../../../data/vos/home_screen_vo/shelf_books_vo/shelf_books_vo.dart';

class ShelfBooksDAOImpl extends ShelfBooksDAO{
  ShelfBooksDAOImpl._();
  static final _singleton=ShelfBooksDAOImpl._();
  factory ShelfBooksDAOImpl()=>_singleton;

  Box<ShelfBooksVO> _getShelfBooksBox()=>Hive.box<ShelfBooksVO>(kShelfBooksBoxName);

  @override
  void clearShelfBox()=>_getShelfBooksBox().clear();

  @override
  List<ShelfBooksVO>? shelfBooksFromBox()=>_getShelfBooksBox().values.toList();

  @override
  Stream<List<ShelfBooksVO>?> shelfBooksFromBoxAsStream()=>Stream.value(shelfBooksFromBox());

  @override
  void shelfBooksToBox(ShelfBooksVO shelfBooksVO){
    _getShelfBooksBox().put(shelfBooksVO.shelfName, shelfBooksVO);
  }

  @override
  Stream watchBox()=>_getShelfBooksBox().watch();

  @override
  void createShelfBooks(String shelfName,{BooksVO? book}) {
    if(book==null){
      final temp=ShelfBooksVO(shelfName, []);
      shelfBooksToBox(temp);
      return;
    }
    final temp=_getShelfBooksBox().get(shelfName);
    temp?.books?.add(book);
    shelfBooksToBox(temp!);
  }

  @override
  void deleteShelfBook(String shelfName, BooksVO? book) {
    final temp=_getShelfBooksBox().get(shelfName);
    temp?.books?.remove(book);
    _getShelfBooksBox().put(shelfName, temp!);
  }

  @override
  void deleteShelf(String shelfName){
    _getShelfBooksBox().delete(shelfName);
  }



}