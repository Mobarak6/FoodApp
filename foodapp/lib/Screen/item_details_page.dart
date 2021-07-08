import 'package:flutter/material.dart';
import 'package:foodapp/models/dammy_data.dart';

class ItemDetailsPage extends StatelessWidget {
  static final routeName = '/itemDetailsPageRoute';
  const ItemDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final routeArgument = ModalRoute.of(context)!.settings.arguments as String;
    final item =
        DUMMY_ITEM.firstWhere((element) => element.id == routeArgument);

    final bool compareSize = mediaQuery.height > mediaQuery.width;
    final INGREDIENTS = 'INGREDIENTS';
    final STEPS = 'STEPS';
    List<Widget> widgetFunction(
      String titleName,
      List<String> argumrntName,
    ) {
      return [
        SizedBox(
          height: 20,
        ),
        Text(
          titleName,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: mediaQuery.height * 0.25,
          width: mediaQuery.width * 0.85,
          //color: Colors.blueGrey,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 1,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text((index + 1).toString()),
                  ),
                  title: Text(
                    argumrntName[index],
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
            itemCount: argumrntName.length,
          ),
        ),
      ];
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            item.title,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.indigo,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: compareSize
                          ? mediaQuery.height * 0.3
                          : mediaQuery.height * 0.4,
                    ),
                  ),
                ),
                SizedBox(
                  height: compareSize
                      ? mediaQuery.height * 0.7
                      : mediaQuery.height * 0.6,
                  child: Column(
                    children: [
                      ...widgetFunction(INGREDIENTS, item.ingredients),
                      ...widgetFunction(STEPS, item.steps),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
