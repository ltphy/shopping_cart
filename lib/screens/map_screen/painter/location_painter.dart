import 'package:flutter/material.dart';
import 'package:shopping/screens/map_screen/map_screen.constants.dart';
import 'package:shopping/screens/map_screen/model/location_point.dart';
import 'package:shopping/services/provider/LocationProvider.dart';
import 'package:shopping/utils/scaleOffset.dart';

// import 'dart:ui';
class LocationPainter extends CustomPainter {
  Offset center;
  LocationMap locationMap;
  final Paint circlePaint = new Paint()
    ..color = Colors.blueAccent
    ..strokeWidth = 10
    ..style = PaintingStyle.fill;
  final Paint locationPaint = new Paint()
    ..color = Colors.white
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;

  LocationPainter(LocationMap map) {
    this.locationMap = map;
  }

  @override
  void paint(Canvas canvas, Size size) {
    this.center = Offset(size.width / 2, size.height / 2);

    this.locationMap.locationList.forEach((element) {
      print("DRAW LOCATION");
      print(element.center);
      drawLocation(canvas, element);
    });

    this.locationMap.locationList.forEach((element) {
      print("DRAW LOCATION");
      print(element.center);
      drawLocationIcon(canvas, element);
    });
  }

  void drawLocation(Canvas canvas, LocationPoint point) {
    canvas.drawCircle(point.center, point.radius, circlePaint);
  }

  void drawLocationIcon(Canvas canvas, LocationPoint point) {
    final icon = Icons.location_on_outlined;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
            height: 1, fontSize: iconSize, fontFamily: icon.fontFamily));
    textPainter.layout();
    textPainter.paint(canvas, translateToIconLocation(point.center, iconSize));
  }

  Offset translateToCenter(Offset point) {
    return point.translate(center.dx, center.dy);
  }

  @override
  bool shouldRepaint(LocationPainter oldDelegate) {
    return this.locationMap != oldDelegate.locationMap;
  }
}
