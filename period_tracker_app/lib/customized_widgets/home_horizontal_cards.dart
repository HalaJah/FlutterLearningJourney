import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:period_tracker_app/customized_widgets/profile_card1.dart';
import 'package:period_tracker_app/services/selectDate.dart';

// HomeHorizontalCards StatefulWidget
class HomeHorizontalCards extends StatefulWidget {
  final String title;

  const HomeHorizontalCards({required this.title});

  @override
  _HomeHorizontalCardsState createState() => _HomeHorizontalCardsState();
}

class _HomeHorizontalCardsState extends State<HomeHorizontalCards> {
  // Variables to hold colors and image paths
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  String image = '';
  List<DateTime?> days = [];

  // Set the card colors based on the title
  void getColor(String title) {
    if (title == 'Fertile Card') {
      color1 = const Color.fromARGB(255, 239, 236, 144);
      color2 = Colors.transparent;
    } else if (title == 'Period Card') {
      color2 = Colors.pink;
    }
  }

  // Set the card image based on the title
  String getImage(String title) {
    if (title == 'Fertile Card') {
      return image = 'assets/HomeCardTwo.png';
    }
    if (title == 'Period Card') {
      return image = 'assets/HomeCardOne.png';
    }
    return image;
  }

  // Initialize the card's colors and image path
  @override
  void initState() {
    super.initState();
    getColor(widget.title);
    getImage(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidth * 0.05, screenHeight * 0.05,
          screenWidth * 0.05, screenHeight * 0.1),
      child: SizedBox(
        width: screenWidth * 0.9,
        height: screenWidth * 0.9,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Main card container
            Container(
              width: screenWidth * 0.8,
              height: screenWidth * 0.8,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, -5),
                    blurRadius: 30,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Card(
                color: color1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text and other widgets inside the card
                    Container(
                      alignment: Alignment.topLeft,
                      width: screenWidth * 0.8,
                      height: screenWidth * 0.62,
                      decoration: BoxDecoration(
                        color: color2,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.1,
                            screenWidth * 0.2,
                            screenWidth * 0.15,
                            screenWidth * 0.1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Remaining widgets.
                            Text(
                              widget.title == 'Period Card'
                                  ? '6 Days left'
                                  : 'Next Fertile',
                              style: TextStyle(
                                fontSize:
                                    widget.title == 'Period Card' ? 35 : 15,
                                fontFamily: 'Merriweather',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.title == 'Period Card'
                                  ? 'Oct 6-Next Period'
                                  : 'Sep 17',
                              style: TextStyle(
                                fontSize:
                                    widget.title == 'Period Card' ? 15 : 50,
                                fontFamily: 'Merriweather',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Button at the top corner of the left part below the container.
                    Align(
                      alignment: widget.title == 'Period Card'
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.05,
                            screenWidth * 0.02,
                            screenWidth * 0.05,
                            screenWidth * 0.005),
                        child: Container(
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.04,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            boxShadow: widget.title == 'Period Card'
                                ? const [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                      spreadRadius: 0,
                                    ),
                                  ]
                                : null,
                            gradient: widget.title == 'Period Card'
                                ? const LinearGradient(
                                    colors: <Color>[
                                      Color.fromARGB(255, 114, 157, 199),
                                      Color.fromARGB(255, 154, 195, 236),
                                      Color.fromARGB(255, 114, 157, 199),
                                    ],
                                  )
                                : null,
                          ),
                          child: widget.title == 'Period Card'
                              ? Align(
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      List<DateTime?>? dates =
                                          await showCalendarDatePicker2Dialog(
                                        context: context,
                                        config: SelectDate.dialog,
                                        dialogSize: const Size(325, 400),
                                        value: days,
                                        borderRadius: BorderRadius.circular(15),
                                      );
                                      //Storing start and end date
                                      if (dates != null) {
                                        setState(() {
                                          ProfileCardOne.startAndEndDates =
                                              dates
                                                  .map((e) => e.toString())
                                                  .toList();
                                          //updateStartandEndDates();
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: widget.title == 'Period Card'
                                          ? Colors.pink
                                          : Colors.transparent,
                                      size: 10,
                                    ),
                                    label: Text(
                                      widget.title == 'Period Card'
                                          ? 'Period starts'
                                          : '',
                                      style: const TextStyle(
                                        fontSize: 9,
                                        fontFamily: 'Merriweather',
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 28, 70, 104),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned image at the bottom of the card
            Positioned(
              bottom: 0,
              left: widget.title == 'Fertile Card' ? 0 : null,
              right: widget.title == 'Period Card' ? 0 : null,
              child: Image.asset(
                image,
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
