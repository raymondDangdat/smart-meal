import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart Meal"),
        centerTitle: true,
      ),
        body: GridView(
          padding: const EdgeInsets.all(15.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3/2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),  children: DUMMY_CATEGORIES.map((categoryData) => CategoryItem(categoryData.id, categoryData.title, categoryData.color)).toList(),),
    );
  }
}
