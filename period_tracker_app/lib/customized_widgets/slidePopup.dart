import 'package:flutter/material.dart';
import 'package:period_tracker_app/database/getID.dart';
import 'package:period_tracker_app/pages/calendar.dart';
import 'package:period_tracker_app/pages/loading.dart';

class SlidePopUp extends StatefulWidget {
  SlidePopUp();

  @override
  _SlidePopUp createState() => _SlidePopUp();
}

class _SlidePopUp extends State<SlidePopUp> {
  final TextEditingController _controller =
      TextEditingController(text: Calendar.displayedNote);

  void _handleTextChanged() {
    Calendar.displayedNote = _controller.text;
    //await savePeriodData(Loading.data);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChanged);
  }

  Widget build(BuildContext context) {
    // Fetch screen dimensions for responsive layout
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.9,
      height: screenWidth * 0.7,
      padding: EdgeInsets.all(screenWidth * 0.15),
      child: SizedBox(
        width: screenWidth * 0.7,
        height: screenWidth * 0.7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Enter a Note to Yourself: ",
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 15,
                  color: Color.fromARGB(255, 67, 62, 62),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: const Color.fromRGBO(222, 74, 123, 1),
                showCursor: true,
                maxLines: 10,
                controller: _controller,
                cursorOpacityAnimates: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Tap here to start typing',
                ),
                style: const TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 10,
                  color: Color.fromARGB(255, 59, 53, 43),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
