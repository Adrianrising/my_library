import 'package:flutter/material.dart';
import 'package:my_library/bloc/home_page_bloc.dart';
import 'package:my_library/bloc/e_books_your_books_bloc.dart';
import 'package:my_library/bloc/search_page_bloc.dart';
import 'package:my_library/bloc/shelves_tab_bloc.dart';
import 'package:my_library/utils/assets_images_util.dart';
import 'package:provider/provider.dart';

extension Navigation on BuildContext{
  EBooksYourBooksBloc getShopBooksPageBlocInstance()=>read<EBooksYourBooksBloc>();

  HomePageBloc getHomePageBlocInstance()=>read<HomePageBloc>();

  ShelvesTabBloc getShelvesTabBlocInstance()=>read<ShelvesTabBloc>();

  SearchPageBloc getSearchPageBlocInstance()=>read<SearchPageBloc>();

  void navigateBack(BuildContext context)=>Navigator.of(context).pop();

  Future navigateToNextScreen(BuildContext context,Widget nextScreen)=>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextScreen));

  Future navigateToNextScreenReplace(BuildContext context,Widget nextScreen)=>
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextScreen,));
}

extension TextCorrection on String{
  String checkCount(){
    if(this=='0'){
      return 'Empty';
    }else if(this=='1'){
      return '$this book';
    }
    else{
      return '$this books';
    }
  }

  String  nullDefaultImage(){
    if(isEmpty){
      return 'http://argauto.lv/application/modules/themes/views/default/assets/images/image-placeholder.png';
    }
    return this;
  }
}