import 'package:flutter/material.dart';

class HomeCards extends StatefulWidget {
  final String title;

  HomeCards({required this.title});

  @override
  _HomeCardsState createState() => _HomeCardsState();
}

class _HomeCardsState extends State<HomeCards> {
  
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  IconData icon = Icons.arrow_back;
  double width = 0.0;


  void getColor(String title){
  if (title == 'Calendar' || title == 'Settings') {
      color1 = const Color.fromARGB(255, 232, 191, 126);
      color2 = const Color.fromARGB(255, 245, 178, 90);
      color3 = const Color.fromARGB(255, 92, 65, 46);
    } else if (title == 'Journal') {
      color1 = const Color.fromARGB(255, 255, 192, 203);
      color2 = const Color.fromARGB(255, 252, 137, 172);
      color3 = const Color.fromARGB(255, 179, 25, 107);
    } else if (title == 'Profile') {
      color1 = const Color.fromARGB(255, 154, 195, 236);
      color2 = const Color.fromARGB(255, 114, 157, 199);
      color3 = const Color.fromARGB(255, 28, 70, 104);
    }
  }

  double getWidth(String title){
    if (title == 'Calendar') {
      return  315;
    } else if (title == 'Journal') {
      return 335;
    } else if (title == 'Profile') {
      return 355;
    }
    else if(title == 'Settings'){
      return 375;
    }
    return 0;
  }

  IconData getIcon(String title)
  {
    if (title == 'Calendar') {
      return Icons. calendar_month_rounded;
    } else if (title == 'Journal') {
      return  Icons.note_alt_rounded;
    } else if (title == 'Profile') {
      icon = Icons.edit_document;
    }
    else if(title == 'Settings'){
      return  Icons.settings_rounded;
    }
     return icon;
  }

  @override
  void initState() {
  super.initState();
  getColor(widget.title);
  width = getWidth(widget.title);
  icon = getIcon(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Material(
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
          ),
        elevation: 60,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve:Curves.bounceOut, 
          width: width,
          child: InkWell(
            onDoubleTap: () {
              setState(() {
                width == getWidth(widget.title) + 14 ? width = getWidth(widget.title) : width = width + 7;
              });
            },
            splashColor: Colors.grey,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              alignment: Alignment.center,
              height: 85,
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
                  SizedBox(width: width - 230),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: color3,
                    )
                    ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: color3,
                  ),

                  
                ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
