import 'package:flutter/material.dart';
import 'package:meal_prep_training/data/dummy_data.dart';
import 'package:meal_prep_training/models/category.dart';
import 'package:meal_prep_training/models/meal.dart';
import 'package:meal_prep_training/screens/meals.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onToggleFav,
  });

  final Category category;
  final void Function(Meal meal) onToggleFav;

  _onSelectMeal(BuildContext context) {
    final List<Meal> meals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: category.title,
                  meals: meals,
                  onToggleFav: onToggleFav,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onSelectMeal(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
