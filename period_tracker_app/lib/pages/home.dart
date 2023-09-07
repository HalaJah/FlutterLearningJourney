import 'package:flutter/material.dart';
import 'package:period_tracker_app/customized_widgets/homeCards.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State{

  List<HomeCards> homeCardsList = [
                                    HomeCards(title: 'Calender'),
                                    HomeCards(title: 'Journal'),
                                    HomeCards(title: 'Profile'),
                                    HomeCards(title: 'Setting'),
                                  ];

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: Column(children: <Widget>[
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: homeCardsList.length,
                itemBuilder: (context, index )
                {
                  return homeCardsList[index];
                }
                ),
            )
            
        
          ],),
        )
      );
  }
}