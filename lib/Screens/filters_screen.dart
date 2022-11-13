import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class Filter extends StatefulWidget {
  static const routeName = '/filters';
  // final Function saveFilters;
  // Filter(void Function(Map<String, bool> filterData) setfilters, {this.saveFilters});
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  Filter(
    this.currentFilters,
    this.saveFilters,
  );
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildswitchlistTile(
      String title, String description, bool currentval, Function updatevalue) {
    return SwitchListTile(
      title: Text(title),
      value: currentval,
      subtitle: Text(description),
      onChanged: updatevalue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilter = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilter);
                })
          ],
        ),
        drawer: Maindrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildswitchlistTile(('Gluten-Free'),
                    ('Press if u want gluten free'), _glutenFree, (newval) {
                  setState(() {
                    _glutenFree = newval;
                  });
                }),
                _buildswitchlistTile(
                  ('Lactose-Free'),
                  ('Click for Lactose free meals'),
                  _lactoseFree,
                  (newval1) {
                    setState(() {
                      _lactoseFree = newval1;
                    });
                  },
                ),
                _buildswitchlistTile(
                  ('Vegan'),
                  ('Click for Vegan meals'),
                  _vegan,
                  (newval) {
                    setState(() {
                      _vegan = newval;
                    });
                  },
                ),
                _buildswitchlistTile(
                    ('Vegetarian'), ('Click for vegetarian meals'), _vegetarian,
                    (newval) {
                  setState(() {
                    _vegetarian = newval;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
