import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/meal_item.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<DummyMeals>(context, listen: false);

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final List<Meal> categoryMeals = meals.mealsByCat(categoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: categoryMeals[index],
          child: MealItem(),
        ),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
