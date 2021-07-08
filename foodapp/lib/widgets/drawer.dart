import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:foodapp/Screen/filter_Screen.dart';

class DrawerWidget extends StatelessWidget {
  static const String routeName = 'DrawerWidgetRouteName';
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQurry = MediaQuery.of(context).size;
    Widget listtileWidget(
        String text, IconData iconData, Function functionControler) {
      return ListTile(
        leading: Icon(iconData),
        title: Text(text),
        onTap: () => functionControler(),
      );
    }

    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: mediaQurry.height * 0.2,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 30),
              child: const Text(
                'Drawer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              color: Theme.of(context).accentColor,
            ),
            listtileWidget('Meals', Icons.food_bank, () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            listtileWidget('Filter', Icons.filter_drama, () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
