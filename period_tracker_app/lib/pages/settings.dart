import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for layout calculations
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Background container
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/WoodTwo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Scaffold for the main content
        Scaffold(
          backgroundColor: Colors.transparent,
          // AppBar
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenWidth * 0.1),
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
                  'Settings',
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

                Stack(children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: screenWidth * 0.7,
                      height: screenWidth * 0.7,
                      color: const Color.fromARGB(255, 237, 166, 190),
                      child: const Text(
                        'This page is still under development. Components will be added in future updates of the app. However, the app is fully functional without the Settings page.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Merriweather',
                          wordSpacing: 2,
                          fontSize: 10,
                          color: Color.fromARGB(255, 59, 53, 43),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset('assets/settingsCat.gif'))
                ])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
