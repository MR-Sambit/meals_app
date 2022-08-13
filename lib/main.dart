import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/categorie_meals_screen.dart';
import './catagories_screen.dart';

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
        '/': (context) => Screen(),
        CategorymealsScreen.routename: (context) => CategorymealsScreen(),
      },
    );
  }
}
