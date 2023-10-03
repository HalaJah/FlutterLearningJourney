import 'package:flutter/material.dart';

class SelectFlow extends StatelessWidget {
  int dropsNum = 0;

  SelectFlow(this.dropsNum);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            dropsNum,
            (i) => const Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(
                Icons.water_drop_rounded,
                color: Color.fromARGB(255, 254, 105, 110),
              ),
            ),
          ),
        ));
  }
}
