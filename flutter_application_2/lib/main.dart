import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: IdCard(),
));

class IdCard extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text('ID Card'),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
        elevation: 10,
      ),
      body: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget> [

              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/Teal_Avatar2.jpg'),
                  radius: 40.0,
                  backgroundColor: Colors.white,
                ),
              ),

              Divider(
                height: 60.0,
                color: Colors.teal,
              ),


              Text(
                'NAME',
                style: TextStyle(
                  color: Colors.teal[400],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5.0,),

              Text(
                'Hala Jahjah',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30.0,),

              Text(
                'COUNTRY OF ORIGIN',
                style: TextStyle(
                  color: Colors.teal[400],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5.0,),

              Text(
                'Syria',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30.0,),

              Row(children: <Widget> [
                Icon(
                  Icons.email,
                  color: Colors.grey,
                ),

                SizedBox(width: 10.0),

                Text(
                  'Hala.Jahjah-1@ou.edu',
                  style:TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,  
                  )
                )
              ],)
            ],
          ),
        ),
        );
  }

}

