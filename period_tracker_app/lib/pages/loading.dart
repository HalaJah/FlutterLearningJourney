import 'package:flutter/material.dart';
import 'package:period_tracker_app/customized_widgets/heart.dart';
import 'package:period_tracker_app/database/getID.dart';
import 'package:period_tracker_app/pages/calendar.dart';
import 'package:period_tracker_app/pages/profile.dart';

// Loading screen widget
class Loading extends StatefulWidget {
  /*  static Map<String, dynamic> data = {
    'startDate': Profile.startDate,
    'endDate': Profile.endDate,
    'cycledays': Profile.cycledays,
    'note': Calendar.displayedNote,
    'mood': Calendar.displayedMood,
    'flow': Calendar.displayedFlow,
    'water': Calendar.displayedWater
  }; */

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () async {
      //await getDeviceID();
      //await savePeriodData(Loading.data);
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Custom heart animation widget
            AnimatedHeart(),
            const SizedBox(height: 20.0),

            // Loading gif
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50.0, 0),
              child: Image.asset(
                'assets/loader.gif',
                width: 250,
                height: 250,
              ),
            ),

            // Text label
            Text(
              'My Period Tracker',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Roboto',
                color: Colors.grey[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
