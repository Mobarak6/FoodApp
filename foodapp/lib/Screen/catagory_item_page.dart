import 'package:flutter/material.dart';
import 'package:foodapp/models/dammy_data.dart';
import 'package:foodapp/widgets/itemCard.dart';

class CatagoryItemPage extends StatelessWidget {
  // final int item;
  // const CatagoryItemPage({
  //   Key? key,
  //   required this.item,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final routeArgument = ModalRoute.of(context)!.settings.arguments as int;
    final title = catagoryList[routeArgument].title;
    final id = catagoryList[routeArgument].id;

    final item = DUMMY_ITEM.where((element) {
      return element.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: mediaQuery.size.height > mediaQuery.size.width
                    ? mediaQuery.size.height * 0.30
                    : mediaQuery.size.height * 0.55,
                child: ItemCard(item: item, index: index),
              );
            },
            itemCount: item.length,
          ),
        ));
  }
}
