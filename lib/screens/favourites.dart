import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
class Favourites extends StatelessWidget {
  final List<Meal> _favouriteMeals;
  Favourites(this._favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (_favouriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favourite meal"),
      );
    } else {
      ListView.builder(
          itemCount: _favouriteMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: _favouriteMeals[index].id,
              title: _favouriteMeals[index].title,
              imageUrl: _favouriteMeals[index].imageUrl,
              duration: _favouriteMeals[index].duration,
              complexity: _favouriteMeals[index].complexity,
              affordability: _favouriteMeals[index].affordability,
            );
          });
    }
  }
}
