import 'package:flutter/material.dart';

import '/Screen/filter_Screen.dart';
import '/models/item.dart';
import 'models/dammy_data.dart';
import '/Screen/catagory_item_page.dart';
import '/Screen/item_details_page.dart';
import '/widgets/catagory_item.dart';
import 'Screen/tabWidgetScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'vegetarian': false,
    'gluten': false,
    'lactose': false,
    'vegan': false,
  };

  List<Item> _availavailItem = DUMMY_ITEM;
  void _setFilter(Map<String, bool> filterdata) {
    setState(() {
      _filter = filterdata;
      _availavailItem = DUMMY_ITEM.where((element) {
        if (_filter['vegetarian'] == true && !element.isVegetarian) {
          return false;
        }
        if (_filter['gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filter['lactose'] == true && !element.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] == true && !element.isVegan) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabWidget(),
        CatagoryItem.routeName: (context) => CatagoryItemPage(_availavailItem),
        ItemDetailsPage.routeName: (context) => ItemDetailsPage(),
        FilterScreen.routeName: (context) => FilterScreen(_setFilter, _filter),
      },
    );
  }
}
