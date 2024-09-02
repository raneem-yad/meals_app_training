import 'package:flutter/material.dart';
import 'package:meal_prep_training/data/dummy_data.dart';
import 'package:meal_prep_training/models/meal.dart';
import 'package:meal_prep_training/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFav});

  final void Function(Meal meal) onToggleFav;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: availableCategories
          .map((item) => CategoryGridItem(category: item, onToggleFav: onToggleFav,))
          .toList(),
    );
  }
}
