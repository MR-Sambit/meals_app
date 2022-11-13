import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_complete_guide/Screens/Premium_screen.dart';
import 'package:flutter_complete_guide/Screens/filters_screen.dart';

class Maindrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up! ',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
                fontSize: 32,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // buildListTile('Premium Version', Icons.superscript_sharp, () {
          //   Navigator.of(context).pushReplacementNamed(Premium.routeName);
          // }),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),

          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(Filter.routeName);
          }),

          // ListTile(
          //   leading: Icon(
          //     Icons.restaurant,
          //     size: 26,
          //   ),
          //   title: Text(
          //     'Meals',
          //     style: TextStyle(
          //       fontFamily: 'RobotoCondensed',
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   onTap: () {
          //     //...
          //   },

          // ListTile(
          //   leading: Icon(
          //     Icons.settings,
          //     size: 26,
          //   ),
          //   title: Text(
          //     'Filters',
          //     style: TextStyle(
          //       fontFamily: 'RobotoCondensed',
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          //   onTap: () {
          //     //...
          //   },
          // ),
        ],
      ),
    );
  }
}
