import 'package:flutter/material.dart';
import 'package:foodapp/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'TestScreen';
  final Function setFilter;
  final Map<String, bool> crentFulter;
  FilterScreen(this.setFilter, this.crentFulter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.crentFulter['gluten'] as bool;
    _isLactoseFree = widget.crentFulter['lactose'] as bool;
    _isVegetarian = widget.crentFulter['vegetarian'] as bool;
    _isVegan = widget.crentFulter['vegan'] as bool;
  }

  Widget _switchListTile(
      String title, String subTitle, bool _cerrentValue, Function function) {
    return SwitchListTile(
      title: Text(title),
      value: _cerrentValue,
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontWeight: FontWeight.w200,
        ),
      ),
      onChanged: (value) => function(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final filter = {
                'vegetarian': _isVegetarian,
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
              };
              widget.setFilter(filter);
            },
            icon: Icon(Icons.done),
          ),
        ],
        title: Text('Filter'),
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.black12,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    ('Adjust your meal selection').toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView(children: [
                    _switchListTile(
                        'Gluten-free',
                        'Only include Gluten-free meal',
                        _isGlutenFree, (value) {
                      setState(() {
                        _isGlutenFree = value;
                      });
                    }),
                    _switchListTile('Vegetarian',
                        'Only include Vegetarian meal', _isVegetarian, (value) {
                      setState(() {
                        _isVegetarian = value;
                      });
                    }),
                    _switchListTile(
                        'Vegan', 'Only include Vegan meal', _isVegan, (value) {
                      setState(() {
                        _isVegan = value;
                      });
                    }),
                    _switchListTile(
                        'Lactose-Free',
                        'Only include Lactose-Free meal',
                        _isLactoseFree, (value) {
                      setState(() {
                        _isLactoseFree = value;
                      });
                    }),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
