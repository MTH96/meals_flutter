import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<DummyMeals>(context);
    final List<Meal> favMeals = meals.favoriteMeals;

    return ListView.builder(
      itemCount: favMeals.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: favMeals[index],
        child: MealItem(),
      ),
    );
  }
}
