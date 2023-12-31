import 'package:flutter/material.dart';
import 'package:world_time_application/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

 

  void setupWorldTime() async{
    WorldTime instance = WorldTime('London','London.png','Europe/London');
    await instance.getTime();
    // Navigator.pushReplacementNamed(context, '/home', arguments :{
    //   'location' : instance.location,
    //   'time' : instance.time,
    //   'flag' : instance.flag,
    //   'isDayTime' : instance.isDayTime,
    // });
    
  }

   @override
  void initState(){
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: Center(
        child: SpinKitPianoWave(
          color:Colors.white,
          size: 50.0,
          )
      )
    );
  }
}