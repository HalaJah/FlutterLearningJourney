import 'package:flutter/material.dart';
import 'package:period_tracker_app/customized_widgets/homeCards.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State{

  List<HomeCards> homeCardsList = [
                                    HomeCards(title: 'Calendar'),
                                    HomeCards(title: 'Journal'),
                                    HomeCards(title: 'Profile'),
                                    HomeCards(title: 'Settings'),
                                  ];
@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 300,
            child: Stack(
            alignment: Alignment.center,
            children: List.generate(
              homeCardsList.length,
              (index) {
                return Positioned(
                  top: 70.0*index, 
                  child: homeCardsList[index] );}
                ),  
            ),
          ),
        ],
      ),
    ),
  );
}
}