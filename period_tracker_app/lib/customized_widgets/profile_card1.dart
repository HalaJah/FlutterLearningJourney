import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:period_tracker_app/services/selectDate.dart';
import 'package:intl/intl.dart';


// ProfileCardOne Stateful Widget
class ProfileCardOne extends StatefulWidget {
  const ProfileCardOne();

  @override
  _ProfileCardOneState createState() => _ProfileCardOneState();
}

class _ProfileCardOneState extends State<ProfileCardOne> {
  // Variable to hold the size of the add icon
  double addIconSize = 20.0;
  List<DateTime> dates = [];
  Future<List<DateTime?>?> results = Future.value([]);
  List<String> startAndEndDates = [];

  

  @override
  Widget build(BuildContext context) {
    // Fetch screen width for layout calculations
    double screenWidth = MediaQuery.of(context).size.width;

    
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        // Container dimensions
        width: screenWidth * 0.8,
        height: screenWidth * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          // Adding a shadow to the container
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 1),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
        ),
        // Child widgets in the container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Storing start and end date and displaying to the screen
            FutureBuilder<List<DateTime?>?>(
            future: results,
            builder: (context, snapshot) {
              if(snapshot.data == null)
              {
                return const Text('');
              }
              else{
                startAndEndDates = snapshot.data!.map((e) => e.toString()).toList();
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Row(
                      children: [
                      const Text(
                      'Start Date: ',
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 10,
                          color: Colors.black,
                      ),
                      ),
                      //if the list is not empty, display the start date
                      startAndEndDates.isNotEmpty
                      ? Text(
                      DateFormat('yyyy-MM-dd').format(DateTime.parse(startAndEndDates[0])),
                      style: const TextStyle(
                        fontFamily: 'Merriweather',
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                      ),
                      )
                      : const Text(''),
                      ]),
                      const SizedBox(width: 15),
                      Row(
                      children: [
                      const Text(
                      'End Date: ',
                      style: TextStyle(
                          fontFamily: 'Merriweather',
                          fontSize: 10,
                          color: Colors.black,
                      ),
                      ),
                      //if the list has two elements, display end date
                      startAndEndDates.length >= 2
                      ? Text(
                      DateFormat('yyyy-MM-dd').format(DateTime.parse(startAndEndDates[1])),
                      style: const TextStyle(
                        fontFamily: 'Merriweather',
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                      ))
                      : const Text('')
                      ])
                    ]),
                );}
              },
            ),
            // Spacing widget
            SizedBox(height: screenWidth * 0.15),
            // Horizontal line
            Container(
              height: 1.5,
              width: screenWidth * 0.75,
              color: const Color.fromARGB(255, 59, 53, 43),
            ),
            // Spacing widget
            const SizedBox(height: 2),
            // Image and Text Container
            Container(
              height: screenWidth * 0.1,
              width: screenWidth * 0.8,
              decoration: const BoxDecoration(
                // Background image
                image: DecorationImage(
                  image: AssetImage('assets/hearts.webp'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon button with functionality
                  InkWell(
                    onTap: () {
                      setState(() {
                        addIconSize >= 23
                            ? addIconSize = 20
                            : addIconSize += 3.0;
                            results = showCalendarDatePicker2Dialog(
                            context: context,
                            config: SelectDate.dialog,
                            dialogSize: const Size(325, 400),
                            value: dates,
                            borderRadius: BorderRadius.circular(15),
                            );
                      });
                    },
                    splashColor: Colors.pink,
                    child: Icon(
                      Icons.add,
                      size: addIconSize,
                      color: const Color.fromARGB(255, 59, 53, 43),
                    ),
                  ),
                  // Text widget
                  const Text(
                    'Add Period Details',
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 15,
                      color: Color.fromARGB(255, 59, 53, 43),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}