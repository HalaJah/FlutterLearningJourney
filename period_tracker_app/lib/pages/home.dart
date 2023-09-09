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
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return SafeArea(
    child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           Padding(
              padding: EdgeInsets.fromLTRB(screenWidth*0.1, screenHeight*0.05,screenWidth*0.1, screenHeight*0.1),
              child: SizedBox(
                width: screenWidth*0.8,
                height: screenWidth*0.8,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      ),
                      shadowColor: Colors.black,
                      elevation: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            width: screenWidth*0.8,
                            height: screenWidth*0.62,
                            decoration: const BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        ),
                                      ),
                            child:Padding(
                              padding: EdgeInsets.all(screenWidth*0.1),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '6 Days',
                                    style: TextStyle(
                                      fontSize: 50, 
                                      fontFamily: 'Merriweather',
                                      fontWeight: FontWeight.bold, 
                                    )
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'until period',
                                    style: TextStyle(
                                      fontSize: 20, 
                                      fontFamily: 'Merriweather',
                                      fontWeight: FontWeight.bold, 
                                    )
                                  )
                                ],
                              )
                              )
                          ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(screenWidth*0.1, screenWidth*0.05, screenWidth*0.1, screenWidth*0.05),
                            child: const Text(
                              'Love you',
                                        style: TextStyle(
                                          fontSize: 15, 
                                          fontFamily: 'Merriweather',
                                          fontWeight: FontWeight.bold, 
                            )
                          ),
                          ),
                        )
                      ],)
                    )
                  ],
                )
              )
              ),
          SizedBox(
            height:screenHeight*0.4 ,
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