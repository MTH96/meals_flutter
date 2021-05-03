import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class MealScreen extends StatelessWidget {
  static const routeName = './meal-screen';

  Widget newSection(BuildContext ctx, String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meals = Provider.of<DummyMeals>(context, listen: false);
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = meals.mealById(mealId);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${meal.title}',
            softWrap: true,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
          ),
        ),
        body: ListView(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.fitWidth,
            ),
            newSection(context, 'Ingredients'),
            Container(
              height: mediaQuery.size.height * .6,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IngredientsBuilder(
                steps: meal.steps,
              ),
            ),
            newSection(context, 'Steps'),
            Container(
              height: mediaQuery.size.height * .6,
              padding: EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: StepsBuilder(meal: meal),
            ),
          ],
        ));
  }
}

class StepsBuilder extends StatelessWidget {
  const StepsBuilder({
    Key key,
    @required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meal.steps.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Text('# ${index + 1}'),
            ),
            title: Text(
              '${meal.steps[index]}',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}

class IngredientsBuilder extends StatelessWidget {
  const IngredientsBuilder({
    Key key,
    @required this.steps,
  }) : super(key: key);

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Container(
        width: 250,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        color: Theme.of(context).accentColor,
        child: Text(
          steps[index],
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
      itemCount: steps.length,
    );
  }
}
