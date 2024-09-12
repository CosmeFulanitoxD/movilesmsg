import 'package:coffeechallenge/colors.dart';
import 'package:coffeechallenge/drink.dart';
import 'package:coffeechallenge/drinkCard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Stack(
        children: <Widget>[
          buildToolbar(),
          buildLogo(size),
        ],
      )),
    );
  }

  Widget buildToolbar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),

      child: Row(children: <Widget>[
        SizedBox(width: 20,),
        Image.asset('images/location.png',width: 30,height: 30,),
        Spacer(),
        Image.asset('images/drawer.png',width: 30,height: 30,),
        SizedBox(width: 20,),
      ]),
    );
  }

  Widget buildLogo(Size size){
    return Positioned(
      top: 10,
      right: size.width/2 - 25,
      child: Image.asset('images/logo.png',width: 50,height: 50,),
      );
  }

  Widget buildPager( Size size){
    return Container(
      child: PageView.builder(itemCount: getDrinks().length,itemBuilder: (context,index)=>Drinkcard(getDrinks()[index])),
    );
  }
  List<Drink> getDrinks() {
    List<Drink> list = [];
    list.add(Drink('Tirami', 
    'Su', 
    'images/blur_image.png', 
    'images/bean_top.png', 
    'images/bean_small.png', 
    'images/bean_blur.png', 
    'then top whit whipped cream and mocha drizzle \n java joy', 
    mBrownLight, 
    mBrown));
    list.add(Drink('Tirama', 
    'Sa', 
    'images/blur_image.png', 
    'images/bean_top.png', 
    'images/bean_small.png', 
    'images/bean_blur.png', 
    'then tap what whipped cream and mocha drizzle \n java joy', 
    mBrownLight, 
    mBrown));
    return list;
  }
}