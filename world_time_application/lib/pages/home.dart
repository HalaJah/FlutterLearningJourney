import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  Map data = {};

  @override
  Widget build(BuildContext context){
    data = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>? ?? {};;

    //set background
    String? bgImage = data['isDayTime'] ? 'DayTime.jpeg' : 'Night.webp';
    Color? bgColor = data['isDayTime'] ? Colors.purple[400] : Colors.purple [200];

    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget> [
                ElevatedButton.icon(
                  onPressed:() {
                    Navigator.pushNamed(context, '/select_location');
                  }, 
                  icon: Icon(
                    Icons.edit_location,
                    ),
                  label: Text('Edit Location'),
                  style : ElevatedButton.styleFrom(
                    backgroundColor: bgColor,
                    
                  )
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.orange[800],
                        child: Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                    ),
                  )
        
          
              ]
              ),
          ),
        ),

    ),
    );
  }
}