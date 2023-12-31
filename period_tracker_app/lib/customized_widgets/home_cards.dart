import 'package:flutter/material.dart';

class HomeCards extends StatefulWidget {
  final String title;
  final String route;

  const HomeCards({required this.title, required this.route});

  @override
  _HomeCardsState createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  IconData icon = Icons.arrow_back;
  double width = 0.0;

  void navigate(route) {
    Navigator.pushNamed(context, '$route');
  }

  // Set colors based on card title
  void getColor(String title) {
    // Colors for 'Calendar'
    if (title == 'Calendar') {
      color1 = const Color.fromARGB(255, 232, 191, 126);
      color2 = const Color.fromARGB(255, 245, 178, 90);
      color3 = const Color.fromARGB(255, 92, 65, 46);
    }
    // Colors for 'Journal'
    else if (title == 'Journal') {
      color1 = const Color.fromARGB(255, 255, 192, 203);
      color2 = const Color.fromARGB(255, 252, 137, 172);
      color3 = const Color.fromARGB(255, 179, 25, 107);
    }
    // Colors for 'Profile'
    else if (title == 'Profile') {
      color1 = const Color.fromARGB(255, 154, 195, 236);
      color2 = const Color.fromARGB(255, 114, 157, 199);
      color3 = const Color.fromARGB(255, 28, 70, 104);
    }
    // Colors for 'Settings'
    else if (title == 'Settings') {
      color1 = const Color.fromARGB(255, 186, 185, 182);
      color2 = const Color.fromARGB(255, 109, 108, 106);
      color3 = const Color.fromARGB(255, 69, 57, 49);
    }
  }

  // Get card width based on title
  double getWidth(String title, double screenWidth) {
    if (title == 'Calendar') {
      return (screenWidth * 0.92) - 60;
    } else if (title == 'Journal') {
      return (screenWidth * 0.92) - 40;
    } else if (title == 'Profile') {
      return (screenWidth * 0.92) - 20;
    } else if (title == 'Settings') {
      return screenWidth * 0.92;
    }
    return 0;
  }

  // Get icon based on card title
  IconData getIcon(String title) {
    if (title == 'Calendar') {
      return Icons.calendar_month_rounded;
    } else if (title == 'Journal') {
      return Icons.note_alt_rounded;
    } else if (title == 'Profile') {
      return Icons.edit_document;
    } else if (title == 'Settings') {
      return Icons.settings_rounded;
    }
    return icon;
  }

  @override
  void initState() {
    super.initState();
    getColor(widget.title);
    icon = getIcon(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (width == 0.0) {
      width = getWidth(widget.title, screenWidth);
    }

    // Return the Material Widget
    return Material(
      color: Colors.transparent,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
      elevation: 60,
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.bounceOut,
        width: width,
        child: InkWell(
          // Double-tap to resize the card
          onDoubleTap: () async {
            setState(() {
              width = width + 5;
            });

            await Future.delayed(const Duration(milliseconds: 500));

            setState(() {
              width = width - 5;
            });

            await Future.delayed(const Duration(seconds: 1));
            navigate(widget.route);
          },
          splashColor: Colors.grey,
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            alignment: Alignment.center,
            height: screenHeight * 0.1,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, -5),
                  blurRadius: 30,
                  spreadRadius: 0,
                ),
              ],
              gradient: LinearGradient(
                colors: <Color>[
                  color2,
                  color1,
                  color2,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  color: color3,
                  size: 30,
                ),
                SizedBox(width: width * 0.2),
                SizedBox(
                  width: width * 0.35,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: color3,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.08,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: color3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
