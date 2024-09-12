import 'package:coffeechallenge/drink.dart';
import 'package:flutter/material.dart';

class Drinkcard extends StatelessWidget {
  Drink drink;
  Drinkcard(this.drink);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          buildTopText(),
        ],
      ),
    );
  }
  
  Widget buildTopText() {
    return Row(
      children: <Widget>[
        SizedBox(width: 20,),
        Text(drink.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, color: drink.LightColor),),
        Text(drink.conName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, color: drink.LightColor),),
      ],
    );
  }
}