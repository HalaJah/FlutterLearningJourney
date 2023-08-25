import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
   home: Scaffold(
    backgroundColor: Colors.pink[100],
    appBar: AppBar(
      title: Text(
        'First Application',
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
      child: Image.asset('assets/images/duck.png')
        ),
    ),
    
   )

);