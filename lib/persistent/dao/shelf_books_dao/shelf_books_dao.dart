import 'package:my_library/data/vos/home_screen_vo/shelf_books_vo/shelf_books_vo.dart';

import '../../../data/vos/home_screen_vo/books_vo/books_vo.dart';


abstract class ShelfBooksDAO{
  void shelfBooksToBox(ShelfBooksVO shelfBooksVO);

  List<ShelfBooksVO> ? shelfBooksFromBox();

  Stream watchBox();

  Stream<List<ShelfBooksVO>?> shelfBooksFromBoxAsStream();

  void createShelfBooks(String shelfName, {BooksVO? book});

  void deleteShelfBook(String shelfName,BooksVO ? book);

  void deleteShelf(String shelfName);

  void clearShelfBox();
}