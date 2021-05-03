import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_scree.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DummyMeals(),
      child: MaterialApp(
        title: 'Meals',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.blue,
          fontFamily: 'Raleway',
        ),
        routes: {
          '/': (ctx) => TabsScreen(),
          FiltersScreen.routeName: (ctx) => FiltersScreen(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          MealScreen.routeName: (ctx) => MealScreen(),
        },
      ),
    );
  }
}
