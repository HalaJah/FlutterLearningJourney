import 'package:flutter/material.dart';

class Loading extends StatefulWidget{
@override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading>{

@override 
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    color: Colors.white,
                    child: CustomPaint(
                      foregroundPainter: Heart(),
                    )

                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0, 50.0, 0),
                    child: Image.asset(
                     'assets/loader.gif',
                     width: 250,
                     height: 250,
                    ),
                  ),
                 
                 Text(
                  'My Period Tracker',
                   style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Eczar',
                    color: Colors.grey[900],
                    shadows: <Shadow>[
                    Shadow(
                    offset: Offset(10.0, 10.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(70, 255, 105, 180),
                    ),]
                  ),
                  ),
              ],
          ),
    ),
  );
}

}

class Heart extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){
    Paint paintFrame = Paint();

    paintFrame.color = Color.fromARGB(255, 33, 33, 33);
    paintFrame.style = PaintingStyle.stroke;
    paintFrame.strokeCap = StrokeCap.round;
    paintFrame.strokeWidth = 3;

    Paint paintFill = Paint();
    
    paintFill.color = Color.fromARGB(255, 255, 105, 180);
    paintFill.style = PaintingStyle.fill;
    paintFill.strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    Path path = Path();

    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
          0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
          0.5 * width, height);

    canvas.drawPath(path, paintFrame);
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate)
  {
    return false;
  }
}