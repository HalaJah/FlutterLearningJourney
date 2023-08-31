import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';


class Loading extends StatefulWidget{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async{
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
    Map data = jsonDecode(response.body);

    String dateTime = data['datatime'];
    String offset = data['utc_offset'].substring(1,3);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);


  }

   @override
  void initState(){
    super.initState();
    getTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Page')
    );
  }
}