import 'package:flutter/material.dart';
import '../dummy_data (1).dart';

class MealsDetails extends StatelessWidget {
  static const routeName = '/meal-deatails';

  Widget buildSection(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buidContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      height: 250,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSection(context, 'Ingridents'),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   child: Text(
            //     'Ingredients',
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            // ),
            buidContainer(ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (contex, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(selectedMeal.ingredients[index])),
                    ))),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(color: Colors.grey),
            //       borderRadius: BorderRadius.circular(10)),
            //   margin: EdgeInsets.all(15),
            //   padding: EdgeInsets.all(10),
            //   height: 150,
            //   width: 270,
            //   child: ListView.builder(
            //       itemCount: selectedMeal.ingredients.length,
            //       itemBuilder: (contex, index) => Card(
            //             color: Theme.of(context).accentColor,
            //             child: Padding(
            //                 padding: EdgeInsets.symmetric(
            //                     vertical: 5, horizontal: 10),
            //                 child: Text(selectedMeal.ingredients[index])),
            //           )),
            // ),
            buildSection(context, 'Steps'),
            buidContainer(ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (Contex, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('#${(index + 1)}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    )))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete_forever),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
