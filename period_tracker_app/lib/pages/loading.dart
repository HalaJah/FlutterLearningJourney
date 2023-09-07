import 'package:flutter/material.dart';
import 'package:period_tracker_app/customized_widgets/heart.dart';

class Loading extends StatefulWidget{
@override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{

@override 
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                  AnimatedHeart(),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0, 50.0, 0),
                    child: Image.asset(
                     'assets/loader.gif',
                     width: 250,
                     height: 250,
                    ),
                  ),
                 
                 Text(
                  'Hala App',
                   style: TextStyle(
                    fontSize: 30.0,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: Colors.grey[900],
                    /* shadows: <Shadow>[
                    Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(100, 255, 105, 180),
                    ),] */
                  )
                  ),
              ],
          ),
    ),
  );
}

}

