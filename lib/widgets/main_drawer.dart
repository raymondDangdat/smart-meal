import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler){
    return ListTile(
      leading: Icon(icon, size: 26.0,),
      title: Text(title, style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24, fontWeight: FontWeight.bold),),
      onTap: tapHandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text("Smart Meal!!", style: TextStyle(fontWeight: FontWeight.w900,
            fontSize: 30.0,
            color: Colors.white),),
          ),

          SizedBox(
            height: 20.0,
          ),

          buildListTile("Restaurant", Icons.restaurant, (){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Filters",Icons.filter, (){
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })


        ],
      ),
    );
  }
}
