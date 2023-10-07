/* import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

Future<String?> getDeviceID() async {
  final prefs = await SharedPreferences.getInstance();
  String? deviceID = prefs.getString('deviceID');

  if (deviceID == null) {
    var deviceID = Uuid(); // Generate a unique string for the device.
    prefs.setString('deviceID', deviceID.v4());
  }

  return deviceID;
}

Future<void> savePeriodData(Map<String, dynamic> data) async {
  String? userID = await getDeviceID();
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('users').child(userID!);
  reference.set(data);
}

Future<Map<String, dynamic>> getPeriodData() async {
  String? userID = await getDeviceID();
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('users').child(userID!);

  // Access the data from the database
  DatabaseEvent event = await reference.once();
  DataSnapshot snapshot = event.snapshot;

  if (snapshot.exists &&
      snapshot.value != null &&
      snapshot.value is Map<dynamic, dynamic>) {
    return Map<String, dynamic>.from(snapshot.value as Map);
  } else {
    return {}; // Return an empty map if there's no data for this user
  }
}

Future<String> getNoteFromPeriodData() async {
  Map<String, dynamic> periodData = await getPeriodData();

  // If the map contains the key 'note', return its value. Otherwise, return null.
  return periodData['note'] as String;
}

Future<Object?> getMoodFromPeriodData() async {
  Map<String, dynamic> periodData = await getPeriodData();

  // If the map contains the key 'note', return its value. Otherwise, return null.
  return periodData['mood'] as Object?;
}

Future<Object?> getFlowFromPeriodData() async {
  Map<String, dynamic> periodData = await getPeriodData();

  // If the map contains the key 'note', return its value. Otherwise, return null.
  return periodData['flow'] as Object?;
}

Future<Object?> getWaterFromPeriodData() async {
  Map<String, dynamic> periodData = await getPeriodData();

  // If the map contains the key 'note', return its value. Otherwise, return null.
  return periodData['water'] as Object?;
}

Future<String> getStartFromPeriodData() async {
  Map<String, dynamic> periodData = await getPeriodData();

  // If the map contains the key 'note', return its value. Otherwise, return null.
  return periodData['startDate'] as String;
}

Future<String> getEndFromPeriodData() async {
  Map<String, dynamic> periodData = await getPeriodData();

  // If the map contains the key 'note', return its value. Otherwise, return null.
  return periodData['endDate'] as String;
}

Future<dynamic> getCycleFromPeriodData() async {
  Map<String, dynamic> periodData = await getPeriodData();

  // If the map contains the key 'note', return its value. Otherwise, return null.
  return periodData['cycledays'];
}
 */