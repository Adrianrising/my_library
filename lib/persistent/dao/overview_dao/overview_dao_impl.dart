import 'package:hive/hive.dart';
import 'package:my_library/data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import 'package:my_library/persistent/dao/overview_dao/overview_dao.dart';

import '../../../constants/hive_constants.dart';

class OverviewDAOImpl extends OverviewDAO{
  OverviewDAOImpl._();
  static final _singleton=OverviewDAOImpl._();
  factory OverviewDAOImpl()=>_singleton;

  Box<BooksListsVO> _getOverviewBox()=>Hive.box<BooksListsVO>(kOverviewBoxName);

  @override
  List<BooksListsVO> ? overviewBooksFromBox()=>_getOverviewBox().values.toList();

  @override
  Stream<List<BooksListsVO>?> overviewBooksFromBoxAsStream()=>Stream.value(overviewBooksFromBox());

  @override
  void overviewBooksToBox(List<BooksListsVO> bookLists) {
    bookLists.forEach((element) {
      _getOverviewBox().put(element.listId, element);
    });
  }

  @override
  Stream watchBox()=>_getOverviewBox().watch();

  @override
  void clearOverviewBox()=>_getOverviewBox().clear();

  @override
  void changeIsFavoriteValue(int id,int bookIndex) {
    final temp=_getOverviewBox().get(id);
    temp?.books?[bookIndex].isFavorite=true;
    print(temp?.books?.map((e) => e.isFavorite));
    print(temp?.books?[bookIndex].isFavorite);
    _getOverviewBox().put(id, temp!);
  }


}