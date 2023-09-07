import 'package:flutter/material.dart';
import 'package:period_tracker_app/pages/loading.dart';
import 'package:period_tracker_app/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/' :(context) => Loading(),
    '/home':(context) => Home(),
  },
));

