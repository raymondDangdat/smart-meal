import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(text, style: Theme.of(context).textTheme.title,),
    );
  }

  Widget buildContainer(Widget child){
   return  Container(
     decoration: BoxDecoration(
         color: Colors.white,
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(10.0)
     ),
     margin: EdgeInsets.all(10.0),
     padding: EdgeInsets.all(10.0),
     height: 150.0, width: 300,
     child: child,
   );
  }


  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),
      centerTitle: true,),
      body: SingleChildScrollView(
        child: new Column(
          children: [
            Container(height: 300, width: double.infinity,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),),

            buildSectionTitle(context, "Ingredients"),

            buildContainer(ListView.builder(
                itemCount: selectedMeal.ingredients.length ,
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text(selectedMeal.ingredients[index]),
                    ),
                  )),
            ),

            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text('# ${index + 1}'),),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(), 
                  ],
                )))

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).pop(mealId);
      }, child: Icon(Icons.delete),),
    );
  }
}
