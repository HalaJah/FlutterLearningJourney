import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_time_application/services/world_time.dart';



class Loading extends StatefulWidget{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

 

  void setupWorldTime() async{
    WorldTime instance = WorldTime('London','London.png','Europe/London');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments :{
      'location' : instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
    });
    
  }

   @override
  void initState(){
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child:Text('loading'),
        )
    );
  }
}