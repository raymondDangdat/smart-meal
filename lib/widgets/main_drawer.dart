import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon){
    return ListTile(
      leading: Icon(icon, size: 26.0,),
      title: Text(title, style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24, fontWeight: FontWeight.bold),),
      onTap: (){},
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
            color: Theme.of(context).accentColor,
            child: Text("Smart Meal!!", style: TextStyle(fontWeight: FontWeight.w900,
            fontSize: 30.0,
            color: Theme.of(context).primaryColor),),
          ),

          SizedBox(
            height: 20.0,
          ),

          buildListTile("Restaurant", Icons.restaurant),
          buildListTile("Filters",Icons.filter)


        ],
      ),
    );
  }
}
