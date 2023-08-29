import 'package:flutter/material.dart';
import 'package:world_time_application/pages/home.dart';
import 'package:world_time_application/pages/loading.dart';
import 'package:world_time_application/pages/select_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/':(context) => Loading(),
    '/home':(context) => Home(),
    '/select_location':(context) => SelectLocation(),
  }

));

