import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability
  });

  String get complexityText{
    switch(complexity){
      case Complexity.Simple :
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText{
    switch (affordability){
      case Affordability.Affordable :
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName, arguments: id);
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 4.0,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(imageUrl, height: 250.0, width: double.infinity, fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 0.0,
                  left: 0.0,
                  child: Container(
                    width: 300.0,
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    color: Colors.black54,
                    child: Center(
                      child: Text(title, style: TextStyle(fontSize: 26.0, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6.0,),
                      Text('$duration mins'),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6.0,),
                      Text(complexityText),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6.0,),
                      Text(affordabilityText),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
