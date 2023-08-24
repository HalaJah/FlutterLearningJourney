import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
   home: Scaffold(
    backgroundColor: Color(0xFFffc0cb),
    appBar: AppBar(
      title: Text('Louliii'),
      centerTitle: true,
    ),
    body: Center(
      child: const Text('Hello'),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
    ),
   )

));