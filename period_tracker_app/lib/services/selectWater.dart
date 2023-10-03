import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectWater extends StatelessWidget {
  int cupsNum = 0;

  SelectWater(this.cupsNum);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            cupsNum,
            (i) => const Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(
                FontAwesomeIcons.glassWater,
                color: Color.fromARGB(255, 128, 204, 218),
              ),
            ),
          ),
        ));
  }
}
