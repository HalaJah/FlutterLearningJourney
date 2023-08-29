import 'package:flutter/material.dart';

class SelectLocation extends StatefulWidget{
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation>{
  @override
  void initState(){
    super.initState();
    print('initState');
  }
  int counter = 0;

  @override
  Widget build(BuildContext context){
    print('build');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        shadowColor: Colors.pink[600],
        title: Text('Location'),
        elevation: 3,
      ),
      body: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            counter += 1;
          });
        },
        icon: Icon(Icons.rounded_corner),
        label: Text('counter is $counter'),
      ),
    );
  }
}