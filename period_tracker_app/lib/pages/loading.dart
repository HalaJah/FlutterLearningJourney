import 'package:flutter/material.dart';
import 'package:period_tracker_app/customized_widgets/heart.dart';

// Loading screen widget
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
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
