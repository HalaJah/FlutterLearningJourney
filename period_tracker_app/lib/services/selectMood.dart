import 'package:flutter/material.dart';

class SelectMood extends StatelessWidget {
  String title = '';
  String imageName = '';

  SelectMood(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(title,
                  style: const TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 15,
                      color: Colors.black)),
            ),
            Image.asset('assets/$title.gif')
          ],
        ));
  }
}
