import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import './models/meal.dart';
import './screens/bottom_tab_screen.dart';
import './screens/filters_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        if(_filters['gluten'] && !meal.isGlutenFree){
           return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId){
   final existingIndex =  _favouriteMeals.indexWhere((meal) => meal.id == mealId);
   if(existingIndex >= 0){
     setState(() {
       _favouriteMeals.removeAt(existingIndex);
     });
   }else{
     setState(() {
       _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
     });
   }
  }

  bool _isMealFavourite(String id){
    return _favouriteMeals.any((meal) => meal.id == id);
  }

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
        '/' : (context) => BottomTabScreen(_favouriteMeals),
        CategoryMealScreen.routeName : (context) => CategoryMealScreen(_availableMeals),
        MealDetailsScreen.routeName : (context) => MealDetailsScreen(_toggleFavourite, _isMealFavourite),
        FilterScreen.routeName : (context) => FilterScreen(_filters, _setFilters),
      },

    //  GIVE A FALL BACK ROUTE INCASE SOMETHING WENT WRONG
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context) => CategoryMealScreen(_availableMeals));
    },
    );
  }
}

