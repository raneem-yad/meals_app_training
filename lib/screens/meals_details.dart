import 'package:flutter/material.dart';
import 'package:meal_prep_training/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: SingleChildScrollView(
        child: Column(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
        ],),
      ),
    );
  }
}
