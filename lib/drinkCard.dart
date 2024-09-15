import 'package:coffeechallenge/colors.dart';
import 'package:coffeechallenge/drink.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Drinkcard extends StatelessWidget {
  Drink drink;
  double pageOffset;
  double? animation; 
  double animate = 0;
  double rotate = 0;
  double ColumnAnimation = 0;
  int index;
  Drinkcard(this.drink, this.pageOffset , this.index);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width-60;
    double cardHeight = size.height*.55;
    double count = 0;
    double page;
    rotate = index -pageOffset;
    for(page = pageOffset; page > 1;){
      page --;
      count ++;
    }
    animation = Curves.easeOutBack.transform(page);
    animate = 100*(count+animation!);
    for(int i = 0; i < index; i ++){
      animate -=100;
      ColumnAnimation-=50;
    }
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          buildTopText(),
          buildBackgroundImage(cardWidth, cardHeight, size),
          buildAboveCard(cardWidth, cardHeight, size),
          buildCupImage(size),
          buildBlurImage(cardWidth,size),
          buildSmallImage(size),
          buildTopImage(cardWidth,size,cardHeight),
        ],
      ),
    );
  }
  
  Widget buildTopText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20,),
          Text(drink.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, color: drink.LightColor),),
          Text(drink.conName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, color: drink.LightColor),),
        ],
      ),
    );
  }
  Widget buildBackgroundImage(double cardWidth, double cardHeight, Size size){
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      bottom: size.height*.15,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(drink.backgroundImage, fit: BoxFit.cover,),
      ),
    ) 
    );
  }
  
  Widget buildAboveCard(double cardWidth, double cardHeight, Size size) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      bottom: size.height*.15,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: drink.darkColor.withOpacity(.50),
          borderRadius: BorderRadius.circular(25)
        ),
        padding: EdgeInsets.all(30),
        child: Transform.translate(
          offset: Offset(-ColumnAnimation, 0),
          child: Column(
            children: <Widget>[
              Text('Frappuccino', 
              style: TextStyle(
                fontSize: 35, 
                fontWeight: FontWeight.bold, 
                color: Colors.white),
                ),
                SizedBox(height: 10,),
                Text( drink.description, style: TextStyle(color: Colors.white70,fontSize: 18),),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(width: 5,),
                    Image.asset('images/cup_L.png'),
                    SizedBox(width: 5,),
                    Image.asset('images/cup_M.png'),
                    SizedBox(width: 5,),
                    Image.asset('images/cup_S.png'),
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  height: 40,
                  decoration: BoxDecoration(color: mAppGreen,borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 20,),
                        Text('\$',style: TextStyle(fontSize: 20,color: Colors.white),),
                        SizedBox(width: 10,),
                        Text('4.',style: TextStyle(fontSize: 19,color: Colors.white),),
                        Text('70',style: TextStyle(fontSize: 14,color: Colors.white),),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
  
  Widget buildCupImage(Size size) {
    return Positioned(
      bottom: 20,
      right: -size.width*.2/2+30,
      child :  Transform.rotate(
        angle: -math.pi/14*rotate,
        child: Image.asset(
          drink.imageCup,
          height: size.height*.55-15,
          ),
          ) ,
      );
  }
  
  buildBlurImage(double cardWidth, Size size) {
    return Positioned(
      right: cardWidth/2-60+animate,
      bottom: size.height*.10,
      child: Image.asset(drink.imageBlur),
    );
  }
  
  Widget buildSmallImage(Size size) {
    return Positioned(
      right: -10+animate,
      top: size.height*.3,
      child: Image.asset(drink.imageSmall)
    );
  }
  
  Widget buildTopImage(double cardWidth ,Size size, double cardHeight) {
    return Positioned(
      left: cardWidth/4-animate,
      bottom: size.height*.15 + cardHeight-25,
      child: Image.asset(drink.imageTop)
      );
  }
}