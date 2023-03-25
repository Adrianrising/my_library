import 'package:flutter/material.dart';
import 'package:my_library/bloc/shop_books_page_bloc.dart';
import 'package:provider/provider.dart';

extension Navigation on BuildContext{
  ShopBooksPageBloc getShopBooksPageBlocInstance()=>read<ShopBooksPageBloc>();

  void navigateBack(BuildContext context)=>Navigator.of(context).pop();

  Future navigateToNextScreen(BuildContext context,Widget nextScreen)=>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextScreen));

  Future navigateToNextScreenReplace(BuildContext context,Widget nextScreen)=>
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextScreen,));
}