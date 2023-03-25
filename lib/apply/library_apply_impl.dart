import 'package:my_library/apply/library_apply.dart';
import 'package:my_library/data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import 'package:my_library/data/vos/search_vo/items_vo/items_vo.dart';
import 'package:my_library/network/data_agent/library_data_agent/library_data_agent.dart';
import 'package:my_library/network/data_agent/library_data_agent/library_data_agent_impl.dart';
import 'package:my_library/persistent/dao/overview_dao/overview_dao.dart';
import 'package:my_library/persistent/dao/overview_dao/overview_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

class LibraryApplyImpl extends LibraryApply{
  LibraryApplyImpl._();
  static final _singleton=LibraryApplyImpl._();
  factory LibraryApplyImpl()=>_singleton;

  final LibraryDataAgent _dataAgent=LibraryDataAgentImpl();
  final OverviewDAO _dao=OverviewDAOImpl();

  @override
  Future<List<BooksListsVO>?> getOverviewBooksFromNetwork()=>_dataAgent
      .getOverviewBooks().then((value){
        final temp=value??[];
        overviewBooksToBox(temp);
        return temp;
  });

  @override
  Future<List<ItemsVO>?> getSearchItemsFromNetwork()=>_dataAgent
      .getSearchItems().then((value){
        final temp=value??[];
        return temp;
  });

  @override
  Stream<List<BooksListsVO>?> overviewBooksFromBoxAsStream()=>_dao
      .watchBox()
      .startWith(_dao.overviewBooksFromBoxAsStream())
      .map((event) =>_dao.overviewBooksFromBox());


  @override
  void overviewBooksToBox(List<BooksListsVO> bookLists)=>_dao.overviewBooksToBox(bookLists);

  @override
  void clearOverviewBox()=>_dao.clearOverviewBox();

  @override
  void changeIsFavoriteValue(int id, int bookIndex)=>_dao.changeIsFavoriteValue(id, bookIndex);



}