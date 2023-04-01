import 'package:flutter/material.dart';
import 'package:my_library/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';

import '../constants/string.dart';
import '../view_items/search_bar_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<HomePageBloc>(
      create: (context)=>HomePageBloc(),
      builder: (context, child) =>Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SearchBarView()
            ];
          },
          body:Consumer<HomePageBloc>(
            builder: (context, obj, child){
              return  IndexedStack(
                index: obj.getBottomNavBarIndex,
                children:obj.bottomNavBarPages,
              );
            },
          )
        ),
        bottomNavigationBar: Consumer<HomePageBloc>(
          builder: (context, obj, _) {
            return  BottomNavigationBar(
              currentIndex:obj.getBottomNavBarIndex,
              onTap: (index){
                obj.changeBottomNavBarIndex(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: kHomeText),
                BottomNavigationBarItem(icon: Icon(Icons.my_library_books),label: kLibraryText),
              ],
            );
          },
        ),
      )
    );
  }
}





