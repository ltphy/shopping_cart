import 'dart:math';

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
    ..color = Colors.red
    ..strokeWidth = 10
    ..style = PaintingStyle.fill;
  final Paint locationPaint = new Paint()
    ..color = Colors.blue
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;
  final Paint locationCenterPaint = new Paint()
    ..color = Colors.yellow
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
      drawLocationIcon(canvas, element);
    });

    this.locationMap.locationList.forEach((element) {
      print("DRAW LOCATION");
      print(element.center);
      drawLocation(canvas, element);
      drawLocationCenter(canvas, element);
    });
  }

  void drawLocation(Canvas canvas, LocationPoint point) {
    canvas.drawCircle(point.center, point.radius, circlePaint);

    Offset iconCenter = point.center.translate(
        cos(point.locationInfo.theta) * iconSize / 2,
        sin(point.locationInfo.theta) * iconSize / 2);
    canvas.drawCircle(iconCenter, point.radius, circlePaint);
  }

  void drawLocationCenter(Canvas canvas, LocationPoint point) {
    Offset iconCenter = point.center.translate(
        cos(point.locationInfo.theta) * iconSize / 2,
        sin(point.locationInfo.theta) * iconSize / 2);
    canvas.drawCircle(iconCenter, point.radius, locationCenterPaint);
  }

  void drawLocationIcon(Canvas canvas, LocationPoint point) {
    canvas.save();
    final icon = Icons.arrow_upward;
    final radians = point.locationInfo.theta + pi / 2;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
            backgroundColor: Colors.white,
            color: Colors.grey,
            height: 1,
            fontSize: iconSize,
            fontFamily: icon.fontFamily));
    textPainter.layout();
    Offset offset = translateToIconLocation(point.center, iconSize);
    canvas.translate(point.center.dx, point.center.dy);
    canvas.rotate(radians);
    canvas.translate(-point.center.dx, -point.center.dy);

    textPainter.paint(canvas, offset);
    canvas.restore();
  }

  Offset translateToCenter(Offset point) {
    return point.translate(center.dx, center.dy);
  }

  @override
  bool shouldRepaint(LocationPainter oldDelegate) {
    return this.locationMap != oldDelegate.locationMap;
  }
}
