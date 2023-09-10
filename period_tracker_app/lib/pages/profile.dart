import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State {
  double addIconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for layout calculations
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Background container
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/WoodFour.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Scaffold for the main content
        Scaffold(
          backgroundColor: Colors.transparent,
          // AppBar
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.1),
            child: Container(
              height: screenWidth * 0.23,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2.0,
                    color: Color.fromARGB(255, 59, 53, 43),
                  ),
                ),
              ),
              child: AppBar(
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 59, 53, 43),
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 23,
                    color: Color.fromARGB(255, 59, 53, 43),
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
               Container(
                height: 1.5,
                color: Color.fromARGB(255, 237, 227, 216),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenWidth*0.8,
                  height: screenWidth*0.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                     boxShadow:[
                     BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 1),
                        blurRadius: 5,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenWidth*0.358), 
                      Container(
                      height: 1.5,
                      width: screenWidth*0.75, 
                      color: Color.fromARGB(255, 59, 53, 43),
                    ),
                      SizedBox(height: 2,), 
                      Container(
                      height: screenWidth * 0.1,
                      width: screenWidth * 0.8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/hearts.webp'),
                          fit: BoxFit.cover, 
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                              addIconSize >= 23 ? addIconSize = 20 : addIconSize += 3.0; 

                            });
                            }, 
                            splashColor: Colors.pink, 
                            child: Icon(
                              Icons.add,
                              size: addIconSize, 
                              color: Color.fromARGB(255, 59, 53, 43),
                            ),
                          ),  
                         
                          Text(
                            'Add Period Details',
                              style: TextStyle(
                                fontFamily: 'Merriweather',
                                fontSize: 15,
                                color: Color.fromARGB(255, 59, 53, 43),
                              ),
                            )
                        ],
                      ),
                    )

                    ]
                    ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(

                ),
              )
            ],
          )
        ),
       
        Positioned(
          bottom: 0, 
          right: 0, 
          child: Image.asset(
            'assets/profileCats.webp',
            width: screenWidth*0.45, 
            height: screenWidth*0.5,
            )
          )
      ],
    );

  }
}