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
  final double border = 0.1;
  final Paint paintBoundary = new Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.fill;

  var paintRectBox = Paint()
    ..color = Color(0xff638965)
    ..style = PaintingStyle.fill;

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
      canvas.save();
      final radians = element.locationInfo.theta;
      double size = 1.25 * 70;
      double borderWidth = 0.1 * 70;
      Offset offset = translateToIconLocation(element.center, iconSize);
      //translate to center
      canvas.translate(element.center.dx, element.center.dy);
      //rotate
      canvas.rotate(radians);
      //translate back
      canvas.translate(-element.center.dx, -element.center.dy);
      //dx - size, dy -size/2
      double dx = element.center.dx - size;
      double dy = element.center.dy - size / 2;

      print(size - border);
      //
      canvas.drawRect(
          Offset(dx + borderWidth, dy + borderWidth) &
              Size(size - (2 * borderWidth), size - (2 * borderWidth)),
          paintRectBox);
      canvas.drawRect(Offset(dx, dy) & Size(size, borderWidth), paintBoundary);

      canvas.drawRect(
          Offset(dx, dy + borderWidth) &
              Size(borderWidth, size - 2 * borderWidth),
          paintBoundary);

      canvas.drawRect(
          Offset(dx, dy + size - borderWidth) & Size(size, borderWidth),
          paintBoundary);
      canvas.restore();

      // drawLocation(canvas, element);
      // drawLocationCenter(canvas, element);
    });
  }

  void drawLocation(Canvas canvas, LocationPoint point) {
    canvas.drawCircle(point.center, point.radius, circlePaint);

    Offset iconCenter = point.center.translate(
        cos(point.locationInfo.theta) * iconSize / 2,
        sin(point.locationInfo.theta) * iconSize / 2);
    // canvas.drawCircle(iconCenter, point.radius, circlePaint);
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
