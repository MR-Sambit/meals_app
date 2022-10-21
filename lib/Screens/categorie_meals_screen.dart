import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data%20(1).dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategorymealsScreen extends StatelessWidget {
  static const routename = '/categories-meals';
  // final String categoryId;
  // final String categoryTitle;
  // CategorymealsScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routearg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routearg['title'];
    final categoryId = routearg['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meals) => meals.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
