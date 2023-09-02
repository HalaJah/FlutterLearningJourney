import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location = ''; //location showing on the UI
  String time = ''; //time in the location
  String flag = ''; //URL to an asset flag icon
  String url= ''; //location url for api endpoint 
  bool isDayTime = true; //wether isDayTime or not 

  WorldTime(this.location, this.flag, this.url);
  Future<void> getTime() async{
  try {

    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    
    isDayTime = now.hour > 1 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
  }
  catch (e) {
    print('caught error is $e');
    time = 'couldnt find time';
  }
 
}

}