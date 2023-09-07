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

  void getColor(String title){
  if (title == 'Calendar' || title == 'Setting') {
      color1 = Color.fromARGB(255, 238, 203, 121);
      color2 = Color.fromARGB(255, 209, 169, 74);
    } else if (title == 'Journal') {
      color1 = Color.fromARGB(255, 255, 192, 203);
      color2 = Color.fromARGB(255, 252, 137, 172);
    } else if (title == 'Profile') {
      color1 = Color.fromARGB(255, 154, 195, 236);
      color2 = Color.fromARGB(255, 114, 157, 199);
    }
  }

  @override
  void initState() {
  super.initState();
  getColor(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 70,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(40, 0, 420, 0),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, -10),
                blurRadius: 200,
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
        ),
      ),
    );
  }
}
