import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:period_tracker_app/customized_widgets/profile_card1.dart';
import 'package:period_tracker_app/customized_widgets/profile_card2.dart';

class Calendar extends StatefulWidget {
  
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int startDate = 0;
  int endDate = 0;
  DateTime startRange = ProfileCardOne.size == 2 ? DateTime.parse(ProfileCardOne.startAndEndDates[0]) : DateTime.now();
  DateTime endRange = ProfileCardOne.size == 2 ? DateTime.parse(ProfileCardOne.startAndEndDates[1]) : DateTime.now();
  int range = 0;
  int cycleDays = 0;

  @override
  void initState() {
    super.initState();
    startDate = ProfileCardOne.size == 2 ? int.parse((ProfileCardOne.startAndEndDates[0]).substring(8, 10)) : 0;
    endDate = ProfileCardOne.size == 2 ? int.parse((ProfileCardOne.startAndEndDates[1]).substring(8, 10)) : 0;
    range = (endDate - startDate) + 1;
    cycleDays = ProfileCardTwo.cycleDays;
  }


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
                  /* onPageChanged: (focusedDay) {
                      DateTime lastDayOfMonth = DateTime(focusedDay.year, focusedDay.month + 1, 0);
                      startDate = startDate + (int.parse(lastDayOfMonth.toString().substring(8, 10)) - ProfileCardTwo.cycleDays);
                      startRange  = DateTime(focusedDay.year, focusedDay.month, startDate);
                      endRange  = DateTime(focusedDay.year, focusedDay.month, startDate + range);

                  }, */
                  pageJumpingEnabled:  true,
                  shouldFillViewport: true,

                   // Calendar settings
                  focusedDay: DateTime.now(),
                  firstDay: DateTime(DateTime.now().year - 10),
                  lastDay: DateTime(DateTime.now().year + 10),
                  

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
                  
                  // Calendar builders
                  calendarBuilders: CalendarBuilders(
                    
                  markerBuilder: (context, date, _) {
                  if (date.isAfter(startRange) && date.isBefore(endRange)) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 225, 155, 179),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    );
                  } else {
                    return null;
                  }
                },

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
