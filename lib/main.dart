import 'package:flutter/material.dart';
import 'package:meal_app/screens/bottom_tab_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: CategoriesScreen(),
      routes: {
        '/' : (context) => BottomTabScreen(),
        CategoryMealScreen.routeName : (context) => CategoryMealScreen(),
        MealDetailsScreen.routeName : (context) => MealDetailsScreen(),
      },

    //  GIVE A FALL BACK ROUTE INCASE SOMETHING WENT WRONG
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context) => CategoryMealScreen());
    },
    );
  }
}

