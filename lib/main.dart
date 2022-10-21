import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Screens/categorie_meals_screen.dart';
import 'package:flutter_complete_guide/Screens/filters_screen.dart';
import 'package:flutter_complete_guide/Screens/meals_details_screen.dart';
import 'package:flutter_complete_guide/Screens/tab_Screen.dart';
import 'Screens/catagories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (context) => tabScreen(),
        CategorymealsScreen.routename: (context) => CategorymealsScreen(),
        MealsDetails.routeName: (context) => MealsDetails(),
        Filter.routeName:(context)=>Filter(),
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
