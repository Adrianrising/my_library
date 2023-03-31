import '../../../data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';

abstract class OverviewDAO{
  void overviewBooksToBox(List<BooksListsVO> bookLists);

  List<BooksListsVO> ? overviewBooksFromBox();

  Stream watchBox();

  Stream<List<BooksListsVO>?> overviewBooksFromBoxAsStream();

  void changeIsFavoriteValueInOverviewBox(int id,int bookIndex);

  void clearOverviewBox();


}