import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isglutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

 const meal(
      {
      @required this.affordability,
      @required this.categories,
      @required this.id,
      @required this.duration,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.isglutenFree,
      @required this.steps,
      @required this.title,
      @required this.complexity
      });
}
