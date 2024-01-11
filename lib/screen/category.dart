import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/categories.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/category_grid_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key,required this.onToggleFavorite,required this.availableMeals});

  final void Function(Meal meal) onToggleFavorite;
  final List<Meal>availableMeals;

  void _selectedCatgory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(meals: filteredMeals, title: category.title,onToggleFavorite: onToggleFavorite,)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectedCatgory(context, category);
            },
          )
      ],
    );
  }
}
