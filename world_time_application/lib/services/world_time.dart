import 'package:http/http.dart';
import 'dart:convert';
//import 'dart:core';

class WorldTime {

  String location = ''; //location showing on the UI
  String time = ''; //time in the location
  String flag = ''; //URL to an asset flag icon
  String url= ''; //location url for api endpoint 

  WorldTime(this.location, this.flag, this.url);
  Future<void> getTime() async{
  try {

    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    
    time = now.toString();
  }
  catch (e) {
    print('caught error is $e');
    time = 'couldnt find time';
  }
 
}

}