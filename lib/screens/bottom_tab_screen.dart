import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './favourites.dart';
import './categories_screen.dart';

class BottomTabScreen extends StatefulWidget {
  final List<Meal> _favouriteMeals;
  BottomTabScreen(this._favouriteMeals);
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': "Categories"
      },
      {
        'page': Favourites(widget._favouriteMeals),
        'title': 'Favourites'
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title']),
        centerTitle: true,
      ),
      drawer: MainDrawer(),

      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme
              .of(context)
              .primaryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          //By default it is set to fixed
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme
                    .of(context)
                    .primaryColor,
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                backgroundColor: Theme
                    .of(context)
                    .primaryColor,
                icon: Icon(Icons.category), label: "Favourites")
          ]),
    );
  }
}
