import 'package:flutter/material.dart';
import 'package:period_tracker_app/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' :(context) => Loading(),
  },
));

