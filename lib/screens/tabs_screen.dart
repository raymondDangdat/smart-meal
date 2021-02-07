import 'package:flutter/material.dart';
import 'package:meal_app/screens/favourites.dart';
import './categories_screen.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
      appBar: AppBar(title: Text("Meals"),
        centerTitle: true,
        bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Categories',),
              Tab(icon: Icon(Icons.favorite), text: "Favourites",),
            ]),),

          body: TabBarView(
              children: [
                CategoriesScreen(),
                Favourites(),
              ]),
    ));
  }
}
