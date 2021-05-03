import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:provider/provider.dart';
import '../widget/drawer_tab.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool loadFilters = true;
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  Widget _buildSwitchListTile(
      String title, String description, bool value, Function switchFunction) {
    return SwitchListTile(
      value: value,
      onChanged: switchFunction,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<DummyMeals>(context, listen: false);
    if (loadFilters) {
      _glutenFree = meals.filters['glutenFree'];
      _vegetarian = meals.filters['vegetarian'];
      _vegan = meals.filters['vegan'];
      _lactoseFree = meals.filters['lactoseFree'];
      loadFilters = false;
    }
    return Scaffold(
      drawer: DrawerTab(),
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Center(
              child: const Text(
                'Adjust your meal selection',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Gluten-Free', 'Only include Gluten-Free meals', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('Lactose-Free',
                  'Only include Lactose-Free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
            ],
          )),
          TextButton.icon(
              icon: Icon(
                Icons.filter_alt_sharp,
                color: Theme.of(context).accentColor,
                size: 40,
              ),
              label: Text('Filter',
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).accentColor,
                  )),
              onPressed: () {
                meals.setFilters(
                  glutenFree: _glutenFree,
                  vegetarian: _vegetarian,
                  vegan: _vegan,
                  lactoseFree: _lactoseFree,
                );
                Navigator.of(context).pushNamed('/');
              }),
        ],
      ),
    );
  }
}
