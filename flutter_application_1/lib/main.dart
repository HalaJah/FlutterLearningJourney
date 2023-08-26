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
      Row(
        children: <Widget>[
          Container(
            color: Colors.pinkAccent[200],
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(5.0),
            child: Row(children: <Widget> [

              Column(children: <Widget> [
              Text(
                  'Period day 13',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'DancingScript',
                  ),
                ),
                Text(
                  'Period ends in 3 days',
                  style: TextStyle(
                  color: Colors.pink[600],
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  ),)
              ],),
              
            
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  child: Image.asset(
                   'assets/images/duck.png',
                    width: 100.0, 
                    height: 100.0, 
                  ),
                ),

                
                    

                    
                    
                  
              
                
          
            ],)
                
            ),
        
        ],
      ),
    ],
  ),
),
);


  
  }

}