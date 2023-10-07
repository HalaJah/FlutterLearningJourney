import 'package:flutter/material.dart';
import 'dart:core';

// ProfileCardTwo Stateful Widget
class ProfileCardTwo extends StatefulWidget {
  static int cycleDays = 0;
  ProfileCardTwo();

  @override
  _ProfileCardTwo createState() => _ProfileCardTwo();
}

class _ProfileCardTwo extends State<ProfileCardTwo> {
  TextEditingController _controller = TextEditingController();
  /*  void updateCycleDays(){
    Navigator.pushNamed(context, '/calendar', arguments: {
      'cycleDays': ProfileCardTwo.cycleDays
    });
  } */

  @override
  Widget build(BuildContext context) {
    // Fetch screen width for layout calculations
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Background Container
            Container(
              width: screenWidth * 0.8,
              height: screenWidth * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 1),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            // Text Widget
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'How Many Days is Your Cycle?',
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 15,
                  color: Color.fromARGB(255, 59, 53, 43),
                ),
              ),
            ),
            // Circle Container
            Positioned(
              bottom: screenWidth * 0.1,
              child: Container(
                width: screenWidth * 0.45,
                height: screenWidth * 0.45,
                decoration: BoxDecoration(
                  color: Colors.pink[200],
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
            // TextField and displayed text
            Positioned(
              bottom: screenWidth * 0.22,
              left: screenWidth * 0.35,
              child: SizedBox(
                width: screenWidth * 0.2,
                height: screenWidth * 0.2,
                child: TextField(
                  cursorColor: const Color.fromRGBO(222, 74, 123, 1),
                  autofocus: true,
                  showCursor: true,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Tap to Enter',
                      hintStyle: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 11,
                        color: Colors.white,
                      )),
                  style: const TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 30,
                    color: Color.fromARGB(255, 59, 53, 43),
                  ),
                  controller: _controller,
                  onSubmitted: (value) {
                    setState(() {
                      if (value != "") {
                        ProfileCardTwo.cycleDays = int.parse(value);
                      }
                    });
                  },
                ),
              ),
            ),
            // Positioned Image
            Positioned(
              bottom: screenWidth * 0.1,
              left: screenWidth * 0.005,
              child: Image.asset(
                'assets/TextFieldCat.png',
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
