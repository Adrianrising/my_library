import 'package:hive/hive.dart';
import 'package:my_library/data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import 'package:my_library/data/vos/home_screen_vo/books_vo/books_vo.dart';
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
  void changeIsFavoriteValueInOverviewBox(int id,int bookIndex) {
    List<BooksVO> containsFavBook=[];
    final temp=_getOverviewBox().get(id);

    temp?.containsFavoriteBook=true;

    temp?.books?[bookIndex].isFavorite=!temp.books![bookIndex].isFavorite!;


    if(temp?.books?[bookIndex].isFavorite==false){
      temp?.books?[bookIndex].dateTime=null;
    }else{
      temp?.books?[bookIndex].dateTime=DateTime.now();
    }

    containsFavBook=temp?.books?.where((element) => element.isFavorite??false).toList()??[];

    if(containsFavBook.isEmpty){
      temp?.containsFavoriteBook=!temp.containsFavoriteBook!;
    }
    _getOverviewBox().put(id, temp!);
  }


}