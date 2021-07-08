import 'package:flutter/material.dart';

import '/Screen/item_details_page.dart';
import '/models/item.dart';

class ItemCard extends StatelessWidget {
  final List<Item> item;
  final int index;

  const ItemCard({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  String get complexity {
    switch (item[index].complexity) {
      case Complexity.Hard:
        return 'Hard';

      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';
    }
  }

  String get affordability {
    switch (item[index].affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Luxurious:
        return 'Luxurious';

      case Affordability.Pricey:
        return 'Pricey';
    }
  }

  void routeFunction(BuildContext context) {
    Navigator.pushNamed(context, ItemDetailsPage.routeName,
        arguments: item[index].id);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => routeFunction(context),
      splashColor: Colors.black,
      child: Card(
        elevation: 5,
        //color: Colors.indigoAccent,
        margin: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: mediaQuery.height > mediaQuery.width
                  ? mediaQuery.height * 0.2
                  : mediaQuery.height * 0.4,
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image(
                      image: Image.network(item[index].imageUrl).image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 30,
                    right: 30,
                    child: Container(
                      color: Colors.black38,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(4),
                      child: Text(
                        item[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height > mediaQuery.width
                  ? mediaQuery.height * 0.08
                  : mediaQuery.height * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_clock),
                      Text('  ${item[index].duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      Text('  $complexity'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.price_check),
                      Text('  $affordability')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
