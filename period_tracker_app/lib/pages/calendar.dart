import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Background Container
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/WoodThree.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        
        // Main Scaffold
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
                    width: 3.0,
                    color: Color.fromARGB(255, 182, 114, 55),
                  ),
                ),
              ),
              child: AppBar(
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 91, 62, 36),
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                title: const Text(
                  'Calendar',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 23,
                    color: Color.fromARGB(255, 91, 63, 38),
                  ),
                ),
              ),
            ),
          ),
          
          // Body of Scaffold
          body: Column(
            children: [
              // Shadow-like line
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                  height: 1.5,
                  color: const Color.fromARGB(255, 234, 172, 107),
                ),
              ),
              
              // Calendar Container
              Container(
                width: screenWidth,
                height: screenWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: TableCalendar(
                  // Calendar Header Style
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    headerPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    headerMargin: EdgeInsets.all(10),
                    titleTextStyle: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 15,
                      color: Color.fromARGB(255, 254, 254, 254),
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.white,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(255, 252, 136, 175),
                          Color.fromRGBO(228, 160, 183, 1),
                          Color.fromARGB(255, 232, 126, 161),
                        ],
                      ),
                    ),
                  ),
                  
                  // Calendar settings
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2023, 9, 1),
                  lastDay: DateTime.utc(2023, 9, 30),
                  
                  // Calendar builders
                  calendarBuilders: CalendarBuilders(
                    
                    // Today cell builder
                    todayBuilder: (context, date, focusedDay) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(243, 172, 195, 1),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        date.day.toString(),
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    
                    // Default cell builder
                    defaultBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 199, 222, 241),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        date.day.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    
                    // Day of Week builder
                    dowBuilder: (context, day) => Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(0.5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        boxShadow: [BoxShadow(
                          blurRadius: 3,
                          color: Colors.pink,
                        )],
                      ),
                      child: Text(
                        DateFormat.E().format(day),
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Merriweather',
                          fontSize: 13,
                        ),
                      ),
                    ),
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
