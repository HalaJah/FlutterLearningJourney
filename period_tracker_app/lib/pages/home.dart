import 'package:flutter/material.dart';
import 'package:period_tracker_app/customized_widgets/homeCards.dart';
import 'package:period_tracker_app/customized_widgets/homeHorizontalCards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  // List of cards to display on the home screen
  List<HomeCards> homeCardsList = [
    const HomeCards(title: 'Calendar'),
    const HomeCards(title: 'Journal'),
    const HomeCards(title: 'Profile'),
    const HomeCards(title: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for layout calculations
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/WoodOne.jpg',
            height: screenHeight,
            width: screenWidth,
            fit: BoxFit.cover,
          ),

          // Scaffold holding main body content
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Horizontal scrollable cards at the top
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      HomeHorizontalCards(title: 'Period Card'),
                      HomeHorizontalCards(title: 'Fertile Card'),
                    ],
                  ),
                ),

                // Positioned cards in the end of the screen
                SizedBox(
                  height: screenHeight * 0.37,
                  child: Stack(
                    alignment: Alignment.center,
                    children: List.generate(
                      homeCardsList.length,
                      (index) {
                        return Positioned(
                          top: 70.0 * index,
                          child: homeCardsList[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Image at the top of the screen
          Image.asset(
            'assets/HangingCats.png',
            width: screenWidth,
            height: screenHeight * 0.226,
          ),
        ],
      ),
    );
  }
}
