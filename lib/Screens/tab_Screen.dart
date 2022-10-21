import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import './catagories_screen.dart';
import './favourite_Screen.dart';

class tabScreen extends StatefulWidget {
  @override
  State<tabScreen> createState() => _tabScreenState();
}

class _tabScreenState extends State<tabScreen> {
  final List<Map<String, Object>> pages = [
    {'page': Screen(), 'title': 'Categories'},
    {'page': FavouriteScreen(), 'title': 'Your Favourite'},
  ];
  int selectedpageindex = 0;
  void Selectpage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(pages[selectedpageindex]['title']),
          ),
          drawer: Maindrawer(),
          body: pages[selectedpageindex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            onTap: Selectpage,
            backgroundColor: Theme.of(context).primaryColorLight,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: selectedpageindex,
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
