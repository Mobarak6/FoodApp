import 'package:flutter/material.dart';
import 'package:foodapp/models/dammy_data.dart';

import '../widgets/catagory_item.dart';

class CatagoriesPage extends StatelessWidget {
  static const String routeName = '/CatagoriesPage';
  const CatagoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: GridView.builder(
        padding: const EdgeInsets.all(1),
        itemBuilder: (context, item) {
          return CatagoryItem(
            item: item,
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          mainAxisExtent: 300,
        ),
        itemCount: catagoryList.length,
      )),
    );
  }
}
