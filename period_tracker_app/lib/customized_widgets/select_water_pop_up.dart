import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:period_tracker_app/database/getID.dart';
import 'package:period_tracker_app/pages/loading.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import 'package:period_tracker_app/services/selectWater.dart';
import 'package:flutter/material.dart';
import 'package:period_tracker_app/pages/calendar.dart';

class SelectWaterPopUp extends StatefulWidget {
  @override
  _SelectWaterPopUpState createState() => _SelectWaterPopUpState();
}

class _SelectWaterPopUpState extends State<SelectWaterPopUp> {
  RadioGroupController myController = RadioGroupController();

  Widget build(BuildContext context) {
    return BasicDialogAlert(
      title: const Text(
        'Select The Level of Water You Drink Per Day: ',
        style: TextStyle(
          fontFamily: 'Merriweather',
          fontSize: 20,
          color: Color.fromARGB(255, 86, 68, 42),
        ),
      ),
      content: SizedBox(
          height: 200,
          child: RadioGroup(
            decoration: const RadioGroupDecoration(
              activeColor: Color.fromARGB(255, 57, 185, 202),
            ),
            controller: myController,
            values: [
              SelectWater(1),
              SelectWater(2),
              SelectWater(3),
              SelectWater(4),
            ],
          )),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BasicDialogAction(
              title: const Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 13,
                  color: Color.fromARGB(255, 116, 218, 241),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              height: 40,
              color: const Color.fromARGB(255, 111, 200, 218),
              child: BasicDialogAction(
                title: const Text(
                  'Okay',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  SelectWater selected = myController.value != null
                      ? myController.value as SelectWater
                      : SelectWater(0);

                  Calendar.displayedWater = selected;
                  //await savePeriodData(Loading.data);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
