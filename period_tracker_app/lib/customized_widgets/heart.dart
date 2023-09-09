import 'package:flutter/material.dart';

// AnimatedHeart class for the animated heart feature used in the loading screen
class AnimatedHeart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.bounceInOut,
      duration: const Duration(seconds: 15),
      builder: (BuildContext context, double opacity, Widget? child) {
        return Opacity(
          opacity: opacity,
          child: Container(
            width: 60.0,
            height: 60.0,
            color: Colors.white,
            child: CustomPaint(
              foregroundPainter: Heart(),
            ),
          ),
        );
      },
    );
  }
}

// CustomPainter to draw a heart shape
class Heart extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint properties for the outline of the heart
    Paint paintFrame = Paint();
    paintFrame.color = const Color.fromARGB(255, 33, 33, 33);
    paintFrame.style = PaintingStyle.stroke;
    paintFrame.strokeCap = StrokeCap.round;
    paintFrame.strokeWidth = 2;

    // Paint properties for filling the heart
    Paint paintFill = Paint();
    paintFill.color = const Color.fromARGB(255, 255, 105, 180);
    paintFill.style = PaintingStyle.fill;
    paintFill.strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    // Create the heart path
    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    // Draw the heart path with the defined paint properties
    canvas.drawPath(path, paintFrame);
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
