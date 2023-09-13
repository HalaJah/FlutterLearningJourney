import 'package:flutter/material.dart';

// ProfileCardTwo Stateful Widget
class ProfileCardTwo extends StatefulWidget {
  const ProfileCardTwo();

  @override
  _ProfileCardTwo createState() => _ProfileCardTwo();
}

class _ProfileCardTwo extends State<ProfileCardTwo> {
  TextEditingController _controller = TextEditingController();
  String _displayedText = "";

  @override
  Widget build(BuildContext context) {
    // Fetch screen width for layout calculations
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
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
          Padding(
            padding: const EdgeInsets.all(10),
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
            bottom: screenWidth * 0.3,
            left: screenWidth * 0.33,
            child: Stack(
              children: [
                Text(
                  _displayedText,
                  style: const TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 13,
                    color: Color.fromARGB(255, 59, 53, 43),
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: TextField(
                    controller: _controller,
                    onChanged: (value) {
                      setState(() {
                        _displayedText = value;
                      });
                    },
                  ),
                ),
              ],
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
    );
  }
}
