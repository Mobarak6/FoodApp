import 'package:flutter/material.dart';
import 'package:foodapp/models/dammy_data.dart';
import 'package:foodapp/models/item.dart';
import 'package:foodapp/widgets/itemCard.dart';

class CatagoryItemPage extends StatefulWidget {
  final List<Item> availableItem;
  CatagoryItemPage(this.availableItem);

  @override
  _CatagoryItemPageState createState() => _CatagoryItemPageState();
}

class _CatagoryItemPageState extends State<CatagoryItemPage> {
  bool initLoaded = false;
  List<Item>? item;
  String? title;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!initLoaded) {
      final routeArgument = ModalRoute.of(context)!.settings.arguments as int;
      title = catagoryList[routeArgument].title;
      final id = catagoryList[routeArgument].id;

      item = widget.availableItem.where((element) {
        return element.categories.contains(id);
      }).toList();
      initLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    //String title;
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: mediaQuery.height > mediaQuery.width
                    ? mediaQuery.height * 0.30
                    : mediaQuery.height * 0.55,
                child: ItemCard(item: item!, index: index),
              );
            },
            itemCount: item!.length,
          ),
        ));
  }
}
