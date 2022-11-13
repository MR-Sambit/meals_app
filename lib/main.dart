import 'package:flutter/material.dart';
import './Screens/categorie_meals_screen.dart';
import './Screens/filters_screen.dart';
import './Screens/meals_details_screen.dart';
import './Screens/tab_Screen.dart';
import './dummy_data (1).dart';
import './Screens/catagories_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<meal> _availableMeals = DUMMY_MEALS;
  List<meal> _favouriteMeals = [];

  void _setfilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isglutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealid) {
    final existingindex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealid);
    if (existingindex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingindex);
      });
    }else{
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealid));
      });
    }
  }
  bool _ismealFav(String id){
    return _favouriteMeals.any((meal) => meal.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',

      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 253, 229, 2),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(color: Color.fromARGB(255, 27, 62, 236)),
            bodyText1: TextStyle(color: Color.fromARGB(255, 176, 48, 48)),
            headline6: TextStyle(
              fontSize: 24,
              fontFamily: 'Robotocondensed',
            )),
      ),
      // home: Screen(),
      routes: {
        '/': (context) => tabScreen(_favouriteMeals),
        CategorymealsScreen.routename: (context) =>
            CategorymealsScreen(_availableMeals),
        MealsDetails.routeName: (context) => MealsDetails(_toggleFavourite,_ismealFav),
        Filter.routeName: (context) => Filter(_filters, _setfilters),
      },
      //Returns to home page if any clicks that are not registared in namedRoute.
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) => Screen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Screen());
      },
    );
  }
}
