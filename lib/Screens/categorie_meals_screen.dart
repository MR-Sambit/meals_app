import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data%20(1).dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategorymealsScreen extends StatefulWidget {
  static const routename = '/categories-meals';
  final List<meal> availableMeals;
  CategorymealsScreen(this.availableMeals);

  @override
  _CategorymealsScreenState createState() => _CategorymealsScreenState();
}

class _CategorymealsScreenState extends State<CategorymealsScreen> {
  String categoryTitle;
  List<meal> displayMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routearg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routearg['title'];
      final categoryId = routearg['id'];
      displayMeals = widget.availableMeals
          .where((meals) => meals.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void removemeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              duration: displayMeals[index].duration,
              complexity: displayMeals[index].complexity,
              affordability: displayMeals[index].affordability,
              // removeitem: removemeal,
            );
          },
          itemCount: displayMeals.length,
        ));
  }
}
