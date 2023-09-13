import 'package:flutter/material.dart';
import 'package:period_tracker_app/customized_widgets/profile_card1.dart';
import 'package:period_tracker_app/customized_widgets/profile_card2.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for layout calculations
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Background container
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/WoodFour.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Scaffold for the main content
        Scaffold(
          backgroundColor: Colors.transparent,
          // AppBar
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.1),
            child: Container(
              height: screenWidth * 0.23,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2.0,
                    color: Color.fromARGB(255, 59, 53, 43),
                  ),
                ),
              ),
              child: AppBar(
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 59, 53, 43),
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 23,
                    color: Color.fromARGB(255, 59, 53, 43),
                  ),
                ),
              ),
            ),
          ),
          // Body of the Scaffold
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Shadow-like line
                Container(
                  height: 1.5,
                  color: const Color.fromARGB(255, 237, 227, 216),
                ),
                // Custom profile card 1
                const ProfileCardOne(),
                // Custom profile card 2
                const ProfileCardTwo(),
              ],
            ),
          ),
        ),
        // Positioned widget for image at the bottom right
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            'assets/profileCats.webp',
            width: screenWidth * 0.45,
            height: screenWidth * 0.5,
          ),
        ),
      ],
    );
  }
}
