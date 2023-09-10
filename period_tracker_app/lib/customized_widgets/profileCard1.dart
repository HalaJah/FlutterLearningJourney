import 'package:flutter/material.dart';

// ProfileCardOne Stateful Widget
class ProfileCardOne extends StatefulWidget {
  const ProfileCardOne();

  @override
  _ProfileCardOneState createState() => _ProfileCardOneState();
}

class _ProfileCardOneState extends State<ProfileCardOne> {
  // Variable to hold the size of the add icon
  double addIconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    // Fetch screen width for layout calculations
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        // Container dimensions
        width: screenWidth * 0.8,
        height: screenWidth * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          // Adding a shadow to the container
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 1),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
        ),
        // Child widgets in the container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spacing widget
            SizedBox(height: screenWidth * 0.358),
            // Horizontal line
            Container(
              height: 1.5,
              width: screenWidth * 0.75,
              color: Color.fromARGB(255, 59, 53, 43),
            ),
            // Spacing widget
            SizedBox(height: 2),
            // Image and Text Container
            Container(
              height: screenWidth * 0.1,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                // Background image
                image: DecorationImage(
                  image: AssetImage('assets/hearts.webp'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon button with functionality
                  InkWell(
                    onTap: () {
                      setState(() {
                        addIconSize >= 23
                            ? addIconSize = 20
                            : addIconSize += 3.0;
                      });
                    },
                    splashColor: Colors.pink,
                    child: Icon(
                      Icons.add,
                      size: addIconSize,
                      color: Color.fromARGB(255, 59, 53, 43),
                    ),
                  ),
                  // Text widget
                  Text(
                    'Add Period Details',
                    style: TextStyle(
                      fontFamily: 'Merriweather',
                      fontSize: 15,
                      color: Color.fromARGB(255, 59, 53, 43),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
