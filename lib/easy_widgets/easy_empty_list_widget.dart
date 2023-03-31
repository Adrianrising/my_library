import 'package:flutter/material.dart';

class EasyEmptyListWidget extends StatelessWidget {
  const EasyEmptyListWidget({Key? key,required this.columnWidgets}) : super(key: key);

  final List<Widget> columnWidgets;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: columnWidgets,
        ),
      ),
    );
  }
}
