import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:period_tracker_app/customized_widgets/profile_card1.dart';
import 'package:period_tracker_app/customized_widgets/profile_card2.dart';
import 'package:period_tracker_app/database/getID.dart';

class Calendar extends StatefulWidget {
  /* static String displayedNote =
      getPeriodData() == {} ? "" : getNoteFromPeriodData() as String;
  static Object? displayedMood =
      getPeriodData() == {} ? SizedBox.shrink() : getMoodFromPeriodData();
  static Object? displayedFlow =
      getPeriodData() == {} ? SizedBox.shrink() : getFlowFromPeriodData();
  static Object? displayedWater =
      getPeriodData() == {} ? SizedBox.shrink() : getWaterFromPeriodData(); */

  static String displayedNote = "";
  static Object? displayedMood = SizedBox.shrink();
  static Object? displayedFlow = SizedBox.shrink();
  static Object? displayedWater = SizedBox.shrink();

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();

  int selectedStartDate = ProfileCardOne.size == 2
      ? int.parse(ProfileCardOne.startAndEndDates[0].substring(8, 10))
      : 1;
  int selectedEndDate = ProfileCardOne.size == 2
      ? int.parse(ProfileCardOne.startAndEndDates[0].substring(8, 10))
      : 1;

  DateTime originalStartRange = ProfileCardOne.size == 2
      ? DateTime.parse(ProfileCardOne.startAndEndDates[0])
          .subtract(const Duration(days: 1))
      : DateTime.now();
  DateTime startRange = DateTime.now();
  DateTime endRange = ProfileCardOne.size == 2
      ? DateTime.parse(ProfileCardOne.startAndEndDates[1])
      : DateTime.now();

  int startDate = 0;
  int endDate = 0;

  int range = 0;
  int cycleDays = 0;

  List<DateTime> savedRange = [];

  Map<int, List<DateTime>> savedRanges = {};

  @override
  void initState() {
    super.initState();
    startDate = selectedStartDate;
    range = endRange.day - originalStartRange.day;
    cycleDays = ProfileCardTwo.cycleDays;
    startRange = originalStartRange;

    savedRange.add(startRange);
    savedRange.add(endRange);

    savedRanges = {startRange.month: savedRange};
  }

  @override
  Widget build(BuildContext context) {
    //data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>? ?? {};

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
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                  onPageChanged: (focusedDay) {
                    DateTime lastDayOfMonth =
                        DateTime(focusedDay.year, focusedDay.month + 1, 0);

                    /*  startRange = focusedDay.month - 1 >= startRange.month && savedRanges[focusedDay.month - 1] != null  ? DateTime.utc(focusedDay.year, focusedDay.month, savedRanges[focusedDay.month - 1]![0].subtract(Duration(days: (lastDayOfMonth.day - cycleDays))).day) : savedRanges[originalStartRange.month]![0] ; 
                      endRange = focusedDay.month - 1 >= startRange.month && savedRanges[focusedDay.month - 1] != null ? DateTime.utc(focusedDay.year, focusedDay.month, savedRanges[focusedDay.month - 1]![1].subtract(Duration(days: (lastDayOfMonth.day - cycleDays))).day) : savedRanges[originalStartRange.month]![1] ; 
                       */
                    if (focusedDay.month - 1 >= startRange.month &&
                        savedRanges[focusedDay.month - 1] != null) {
                      DateTime? startValue =
                          savedRanges[focusedDay.month - 1]?[0];
                      DateTime? endValue =
                          savedRanges[focusedDay.month - 1]?[1];
                      if (startValue != null && endValue != null) {
                        startRange = DateTime.utc(
                            focusedDay.year,
                            focusedDay.month,
                            startValue
                                .subtract(Duration(
                                    days: (lastDayOfMonth.day - cycleDays)))
                                .day);
                        endRange = DateTime.utc(
                            focusedDay.year,
                            focusedDay.month,
                            endValue
                                .subtract(Duration(
                                    days: (lastDayOfMonth.day - cycleDays)))
                                .day);
                      }
                    } else {
                      DateTime? originalStartValue =
                          savedRanges[originalStartRange.month]?[0];
                      DateTime? originalEndValue =
                          savedRanges[originalStartRange.month]?[1];
                      if (originalStartValue != null &&
                          originalEndValue != null) {
                        startRange = originalStartValue;
                        endRange = originalEndValue;
                      }
                    }

                    setState(() {
                      savedRange.add(startRange);
                      savedRange.add(endRange);
                      savedRanges[focusedDay.month] = savedRange;
                      savedRanges = {
                        focusedDay.month: savedRange,
                      };
                      _focusedDay = focusedDay;
                    });
                  },
                  pageJumpingEnabled: true,
                  shouldFillViewport: true,

                  // Calendar settings
                  focusedDay: _focusedDay,
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
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
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
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Colors.pink,
                          )
                        ],
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
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Stack(children: [
                    SizedBox(
                      width: screenWidth * 0.53,
                      height: screenWidth * 0.85,
                      child: Card(
                          color: const Color.fromARGB(255, 242, 171, 195),
                          shadowColor: Colors.black,
                          elevation: 50,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("Notes: ",
                                    style: TextStyle(
                                      fontFamily: 'Merriweather',
                                      fontSize: 13,
                                      color: Colors.white,
                                    )),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15.0, 10.0, 15.0, 10.0),
                                    child: Text(Calendar.displayedNote,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontFamily: 'Merriweather',
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(255, 46, 44, 44),
                                        ))),
                              )
                            ],
                          )),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Image.asset(
                        'assets/noteFlower.png',
                        width: screenWidth * 0.25,
                        height: screenWidth * 0.25,
                      ),
                    ),
                  ]),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                          width: screenWidth * 0.395,
                          height: screenWidth * 0.42,
                          child: Card(
                              color: const Color.fromARGB(255, 247, 252, 186),
                              shadowColor: Colors.black,
                              elevation: 50,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "Your Mood: ",
                                        style: TextStyle(
                                          fontFamily: 'Merriweather',
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(255, 46, 44, 44),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Calendar.displayedMood as Widget,
                                  )
                                ],
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                          width: screenWidth * 0.395,
                          height: screenWidth * 0.42,
                          child: Card(
                              color: const Color.fromARGB(255, 171, 210, 242),
                              shadowColor: Colors.black,
                              elevation: 50,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "Blood flow: ",
                                        style: TextStyle(
                                          fontFamily: 'Merriweather',
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(255, 46, 44, 44),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    width: screenWidth * 0.395,
                                    height: screenWidth * 0.12,
                                    child: SizedBox(
                                      child: Calendar.displayedFlow as Widget,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        "Drinking water: ",
                                        style: TextStyle(
                                          fontFamily: 'Merriweather',
                                          fontSize: 10,
                                          color:
                                              Color.fromARGB(255, 46, 44, 44),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    width: screenWidth * 0.395,
                                    height: screenWidth * 0.12,
                                    child: SizedBox(
                                      child: Calendar.displayedWater as Widget,
                                    ),
                                  ),
                                ],
                              ))),
                    )
                  ],
                )
              ])
            ],
          ),
        ),
      ],
    );
  }
}
