import 'package:flutter/material.dart';

class Categories_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: <Widget>[],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 200,
        crossAxisSpacing: 3 / 2,
        maxCrossAxisExtent: 20,
        mainAxisExtent: 20,
      ),
    );
  }
}
