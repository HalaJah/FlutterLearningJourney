import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
   home: Home(),
   )

);

class Home extends StatelessWidget
{
  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
    backgroundColor: Colors.pink[100],
    appBar: AppBar(
      title: Text(
        'Hala First Application',
        style: TextStyle(
        fontFamily: 'DancingScript',
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        ),
        ),
      centerTitle: true,
      backgroundColor: Colors.pink[300],
    ),
    body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Container(
        color: Colors.pinkAccent[200],
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                children: <Widget>[
                  Text(
                    'Last day period',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'DancingScript',
                    ),
                  ),
                  Text(
                    'Period ends today!',
                    style: TextStyle(
                      color: Colors.pink[600],
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/cat2.png',
                width: 70.0,
                height: 70.0,
              ),
            ),
          ],
        ),
      ),
    
      Container(
        color: Colors.pinkAccent[100],
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Column(
                children: <Widget>[
                  Text(
                    'First day period',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'DancingScript',
                    ),
                  ),
                  Text(
                    'Period ends in 5 days',
                    style: TextStyle(
                      color: Colors.pink[600],
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/cat3.png',
                width: 70.0,
                height: 70.0,
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