import 'package:flutter/material.dart';
import 'package:world_time_application/services/world_time.dart';

class SelectLocation extends StatefulWidget{
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation>{
 
 List<WorldTime> locations =
 [
  WorldTime('Beirut', 'Beirut.jpg', 'Asia/Beirut'),
  WorldTime( 'Toronto', 'Toronto.jpeg', 'America/Vancouver'),
  WorldTime( 'Nicosia', 'Nicosia.webp', 'Europe/Nicosia'),
  WorldTime( 'Paris', 'Paris.png', 'Europe/Paris'),
  WorldTime( 'Kuala Lumpur', 'Kuala_Lumpur.png', 'Asia/Kuala_Lumpur'),
  WorldTime( 'Maastricht', 'Maastricht.png', 'Europe/Amsterdam'),
  WorldTime( 'Oklahoma', 'Oklahoma.png', 'America/Chicago'),
  WorldTime( 'Phuket', 'Phuket.png', 'Asia/Bangkok'),
  WorldTime( 'Dodoma', 'Dodoma.png', 'Africa/Dodoma'),
 ];
  
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location' : instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'isDayTime' : instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context){
    print('build');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        shadowColor: Colors.purple[600],
        title: Text('Choose Location'),
        centerTitle:true,
        elevation: 3,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              elevation: 4.0,
              shadowColor: Colors.purple[400],
              child: ListTile(
                onTap:() {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  )
              )
            ),
          );
        }
        )
      );
  }
}