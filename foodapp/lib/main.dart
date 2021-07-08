import 'package:flutter/material.dart';

import 'package:foodapp/Screen/filter_Screen.dart';

import '/Screen/catagory_item_page.dart';
import '/Screen/item_details_page.dart';
import '/widgets/catagory_item.dart';
import 'Screen/tabWidgetScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('object');
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabWidget(),
        CatagoryItem.routeName: (context) => CatagoryItemPage(),
        ItemDetailsPage.routeName: (context) => ItemDetailsPage(),
        FilterScreen.routeName: (context) => FilterScreen(),
      },
    );
  }
}
