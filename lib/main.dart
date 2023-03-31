import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_library/constants/hive_constants.dart';
import 'package:my_library/data/vos/home_screen_vo/books_lists_vo/books_lists_vo.dart';
import 'package:my_library/data/vos/home_screen_vo/books_vo/books_vo.dart';
import 'package:my_library/data/vos/home_screen_vo/buy_links_vo/buy_links_vo.dart';
import 'package:my_library/data/vos/home_screen_vo/shelf_books_vo/shelf_books_vo.dart';
import 'package:my_library/data/vos/search_history_vo/search_history_vo.dart';
import 'package:my_library/pages/home_page.dart';

void main()async {
  await Hive.initFlutter();

  Hive.registerAdapter(BooksListsVOAdapter());
  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(BuyLinksVOAdapter());
  Hive.registerAdapter(ShelfBooksVOAdapter());
  Hive.registerAdapter(SearchHistoryVOAdapter());

  await Hive.openBox<ShelfBooksVO>(kShelfBooksBoxName);
  await Hive.openBox<BooksListsVO>(kOverviewBoxName);
  await Hive.openBox<SearchHistoryVO>(kSearchHistoryBoxName);
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Library',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home:const HomePage()
    );
  }
}
