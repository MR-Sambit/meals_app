import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import './catagories_screen.dart';
import './favourite_Screen.dart';

class tabScreen extends StatefulWidget {
  final List<meal> favouriteMeals;

  tabScreen(this.favouriteMeals);

  @override
  State<tabScreen> createState() => _tabScreenState();
}

class _tabScreenState extends State<tabScreen> {
  List<Map<String, Object>> _pages;
  int _selectedpageindex = 0;
  @override
  void initState() {
    _pages=[
      {'page': Screen(), 'title': 'Categories'},
      {
        'page': FavouriteScreen(widget.favouriteMeals),
        'title': 'Your Favourite'
      },
    ];
    super.initState();
  }

  void Selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectedpageindex]['title']),
          ),
          drawer: Maindrawer(),
          body: _pages[_selectedpageindex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            onTap: Selectpage,
            backgroundColor: Theme.of(context).primaryColorLight,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedpageindex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.pinkAccent,
                icon: Icon(Icons.category_sharp),
                title: Text('Categories'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded),
                title: Text('Favourites'),
              )
            ],
          ),
        ));
  }
}
