import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:period_tracker_app/database/getID.dart';
import 'package:period_tracker_app/pages/loading.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import 'package:period_tracker_app/services/selectMood.dart';
import 'package:flutter/material.dart';
import 'package:period_tracker_app/pages/calendar.dart';

class SelectMoodPopUp extends StatefulWidget {
  @override
  _SelectMoodPopUpState createState() => _SelectMoodPopUpState();
}

class _SelectMoodPopUpState extends State<SelectMoodPopUp> {
  RadioGroupController myController = RadioGroupController();

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BasicDialogAlert(
      title: const Text(
        'Select Your Mood',
        style: TextStyle(
          fontFamily: 'Merriweather',
          fontSize: 20,
          color: Color.fromARGB(255, 86, 68, 42),
        ),
      ),
      content: SizedBox(
          height: 450,
          child: RadioGroup(
            decoration: const RadioGroupDecoration(
              activeColor: Color.fromARGB(255, 214, 61, 112),
            ),
            controller: myController,
            values: [
              SelectMood('confused'),
              SelectMood('exhausted'),
              SelectMood('mad'),
              SelectMood('relaxed'),
              SelectMood('shocked'),
              SelectMood('sick'),
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
                  color: Color.fromARGB(255, 235, 110, 172),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              height: 40,
              color: const Color.fromARGB(255, 235, 110, 172),
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
                  SelectMood selected = myController.value != null
                      ? myController.value as SelectMood
                      : SelectMood("");

                  Calendar.displayedMood = (selected.title.isNotEmpty)
                      ? Image.asset(
                          'assets/${selected.title}.gif',
                          width: screenWidth * 0.25,
                          height: screenWidth * 0.25,
                        )
                      : Calendar.displayedMood;
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
