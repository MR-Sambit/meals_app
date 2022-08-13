import 'package:flutter/material.dart';

class CategorymealsScreen extends StatelessWidget {
  static const routename='/categories-meals';
  // final String categoryId;
  // final String categoryTitle;
  // CategorymealsScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routearg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routearg['title'];
    final categoryId = routearg['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(" The recipe goes here...."),
      ),
    );
  }
}
