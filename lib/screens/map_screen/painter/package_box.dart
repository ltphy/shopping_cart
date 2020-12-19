import 'package:flutter/material.dart';

class PackageBox extends CustomPainter {
  final Paint locationPaint = new Paint()
    ..color = Colors.blue
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    Offset startingPoint = Offset(0,1.0*70);
    Offset endingPoint = Offset(0, 70+14.0);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}