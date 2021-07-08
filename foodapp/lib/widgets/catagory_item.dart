import 'package:flutter/material.dart';

import '/models/dammy_data.dart';

class CatagoryItem extends StatelessWidget {
  final int item;
  static const routeName = '/catagory_item_page';

  const CatagoryItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemId = DUMMY_ITEM.where((element) {
      return element.categories.contains(catagoryList[item].id);
    }).toList();

    final imageLink = itemId.map((e) => e.imageUrl).last;

    void catagoryTouch(context) {
      print('catagoryTouch');
      Navigator.of(context).pushNamed(
        routeName,
        arguments: item,
      );
    }

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            catagoryList[item].color.withOpacity(0.3),
            catagoryList[item].color,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      //color: catagoryList[item].color,
      child: InkWell(
        onTap: () => catagoryTouch(context),
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.black,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                imageLink,
                fit: BoxFit.fitHeight,
                height: 230,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                catagoryList[item].title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                  backgroundColor: Colors.white10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
