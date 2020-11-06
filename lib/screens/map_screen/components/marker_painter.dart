import 'package:flutter/material.dart';

// import 'dart:ui';
class MarkerPainter extends CustomPainter {
  Offset center;

  @override
  void paint(Canvas canvas, Size size) {
    this.center = Offset(size.width / 2, size.height / 2);
    var paint = new Paint();
    paint
      ..color = Colors.white
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    final icon = Icons.backpack;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style:
            TextStyle(height: 1, fontSize: 30.0, fontFamily: icon.fontFamily));
    textPainter.layout();
    textPainter.paint(canvas, translateToCenter(Offset(50.0, 50.0)));
  }

  Offset translateToCenter(Offset point) {
    return point.translate(center.dx, center.dy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
