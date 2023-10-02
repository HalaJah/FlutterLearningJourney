import 'package:flutter/material.dart';
import 'package:period_tracker_app/customized_widgets/list_view_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:period_tracker_app/customized_widgets/slidePopup.dart';
import 'package:slide_popup_dialog_null_safety/slide_popup_dialog.dart'
    as slideDialog;

class Journal extends StatefulWidget {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  // Declare a list of ListViewWidget objects
  List<ListViewWidget> listView = [
    ListViewWidget('Note', 'solidNoteSticky'),
    ListViewWidget('Moods', 'faceFrownOpen'),
    ListViewWidget('Flow', 'droplet'),
    ListViewWidget('Drink Water', 'glassWater'),
  ];

  // Function to get IconData by iconName
  IconData getIconByName(String iconName) {
    switch (iconName) {
      case 'solidNoteSticky':
        return FontAwesomeIcons.solidNoteSticky;
      case 'faceFrownOpen':
        return FontAwesomeIcons.faceFrownOpen;
      case 'droplet':
        return FontAwesomeIcons.droplet;
      case 'glassWater':
        return FontAwesomeIcons.glassWater;
      default:
        return FontAwesomeIcons
            .question; // Return a default icon if iconName doesn't match
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for responsive layout
    double screenHeight = MediaQuery.of(context).size.height;
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
            preferredSize: Size.fromHeight(screenHeight * 0.1),
            child: Container(
              height: screenWidth * 0.23,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2.0,
                    color: Color.fromARGB(255, 207, 134, 32),
                  ),
                ),
              ),
              child: AppBar(
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 146, 99, 35),
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                title: const Text(
                  'Journal',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 23,
                    color: Color.fromARGB(255, 146, 99, 35),
                  ),
                ),
              ),
            ),
          ),
          // Main Body Content
          body: Column(
            children: [
              // Shadow-like effect
              Container(
                height: 1,
                color: const Color.fromARGB(255, 240, 211, 180),
              ),
              // Padding for the main content
              Padding(
                padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                    screenWidth * 0.1, screenWidth * 0.05, screenWidth * 0.05),
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      // White background container
                      Container(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 1),
                              blurRadius: 10,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                      // Image at the top
                      Positioned(
                        top: 0,
                        child: Image.asset(
                          'assets/HangingCats2.jpg',
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.2,
                        ),
                      ),
                      // ListView.builder for the cards
                      Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.6,
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenWidth * 0.005,
                                    horizontal: screenWidth * 0.005),
                                child: SizedBox(
                                  height: screenWidth * 0.25,
                                  child: Card(
                                    elevation: 4.0,
                                    shadowColor: Colors.black,
                                    child: ListTile(
                                      onTap: () {
                                        switch (listView[index].title) {
                                          case 'Note':
                                            slideDialog.showSlideDialog(
                                              pillColor: Colors.pink[100],
                                              context: context,
                                              child: SingleChildScrollView(
                                                  child: SlidePopUp()),
                                            );
                                        }
                                      },
                                      title: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              listView[index].title,
                                              style: const TextStyle(
                                                fontFamily: 'Merriweather',
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 113, 83, 41),
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Color.fromARGB(
                                                  255, 113, 83, 41),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Icon leading the card
                                      leading: Icon(
                                        getIconByName(listView[index].iconName),
                                        size: 50,
                                        color: const Color.fromRGBO(
                                            249, 166, 194, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
