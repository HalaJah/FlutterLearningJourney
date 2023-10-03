import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import 'package:period_tracker_app/services/selectFlow.dart';
import 'package:flutter/material.dart';
import 'package:period_tracker_app/pages/calendar.dart';

class SelectFlowPopUp extends StatefulWidget {
  @override
  _SelectFlowPopUpState createState() => _SelectFlowPopUpState();
}

class _SelectFlowPopUpState extends State<SelectFlowPopUp> {
  RadioGroupController myController = RadioGroupController();

  Widget build(BuildContext context) {
    return BasicDialogAlert(
      title: const Text(
        'Select The Level of Blood Flow: ',
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
              activeColor: Color.fromARGB(255, 233, 98, 98),
            ),
            controller: myController,
            values: [
              SelectFlow(1),
              SelectFlow(2),
              SelectFlow(3),
              SelectFlow(4),
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
                  color: Color.fromARGB(255, 222, 99, 99),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              height: 40,
              color: const Color.fromARGB(255, 222, 82, 82),
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
                  SelectFlow selected = myController.value != null
                      ? myController.value as SelectFlow
                      : SelectFlow(0);

                  Calendar.displayedFlow = selected;
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
