import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<meal> favouritemeal;
  FavouriteScreen(this.favouritemeal);
  @override
  Widget build(BuildContext context) {
    if (favouritemeal.isEmpty) {
      return Center(
        child: Text('The Favourites yet to be added'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouritemeal[index].id,
            title: favouritemeal[index].title,
            imageUrl: favouritemeal[index].imageUrl,
            duration: favouritemeal[index].duration,
            complexity: favouritemeal[index].complexity,
            affordability: favouritemeal[index].affordability,
          );
        },
        itemCount: favouritemeal.length,
      );
    }
  }
}
