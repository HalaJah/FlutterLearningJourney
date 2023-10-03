import 'package:flutter/material.dart';
import 'package:period_tracker_app/pages/journal.dart';
import 'package:period_tracker_app/pages/loading.dart';
import 'package:period_tracker_app/pages/home.dart';
import 'package:period_tracker_app/pages/profile.dart';
import 'package:period_tracker_app/pages/calendar.dart';
import 'package:period_tracker_app/pages/settings.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/journal': (context) => Journal(),
        '/profile': (context) => Profile(),
        '/calendar': (context) => Calendar(),
        '/settings': (context) => Settings(),
      },
    ));
