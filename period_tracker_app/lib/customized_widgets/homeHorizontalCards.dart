import 'package:flutter/material.dart';

class HomeHorizontalCards extends StatefulWidget {
  final String title;

  HomeHorizontalCards({required this.title});

  @override
  _HomeHorizontalCardsState createState() => _HomeHorizontalCardsState();
}

class _HomeHorizontalCardsState extends State<HomeHorizontalCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(),
        shadowColor: Colors.black,
        
      )
      ); }

}