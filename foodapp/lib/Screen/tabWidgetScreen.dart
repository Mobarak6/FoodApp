import 'package:flutter/material.dart';
import 'package:foodapp/Screen/catagories_page.dart';
import 'package:foodapp/Screen/filter_Screen.dart';
import 'package:foodapp/widgets/drawer.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  static const List<Map<String, Object>> _listWidget = [
    {
      'page': CatagoriesPage(),
      'title': 'Categories',
    },
    {
      'page': (Text('Favorite List')),
      'title': 'Favorite',
    }
  ];
  int _currentIndex = 0;
  void _selectFunction(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Center(child: Text(_listWidget[_currentIndex]['title'] as String)),
      ),
      drawer: DrawerWidget(),
      body: _listWidget[_currentIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          )
        ],
        currentIndex: _currentIndex,
        onTap: _selectFunction,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        //unselectedItemColor: Colors.black26,
        unselectedIconTheme: IconThemeData(color: Colors.black26),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black26,
      ),
    );
  }
}
