import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loading extends StatefulWidget{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Page')
    );
  }
}