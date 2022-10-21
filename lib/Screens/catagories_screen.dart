import 'package:flutter/material.dart';
import '../widgets/categories_item.dart';
import '../dummy_data (1).dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((catdata) => CategoryItem(
                id: catdata.id,
                title: catdata.title,
                color: catdata.color,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
