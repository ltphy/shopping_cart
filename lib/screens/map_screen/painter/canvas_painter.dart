import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping/constants/constants.dart';
import 'package:shopping/screens/map_screen/model/location_point.dart';

class CanvasPainter extends CustomPainter {
  Offset center;
  LocationMap locationMap;

  CanvasPainter(LocationMap map) {
    this.locationMap = map;
  }

  double bound = 200.0;
  final Paint circlePaint = new Paint()
    ..color = Colors.red
    ..strokeWidth = 10
    ..style = PaintingStyle.fill;
  @override
  void paint(Canvas canvas, Size size) {
    this.center = Offset(size.width / 2, size.height / 2);

    this.locationMap.locationList.forEach((element) {
      // drawPallet(canvas, element);
      drawDuck(canvas, element, size);
    });
  }

  @override
  bool shouldRepaint(CanvasPainter canvasPainter) {
    return this.locationMap != canvasPainter.locationMap;
  }

  void drawDuck(Canvas canvas, LocationPoint element, Size size) {
    print("Width ${size.width} Height ${size.height}");
    final radians = element.locationInfo.theta;
    double height = svgDuck.viewport.height;
    double width = svgDuck.viewport.width;

    print("Width $width Height $height");

    canvas.drawCircle(
        new Offset(0.0, 0.0), 2.0, new Paint()..color = Colors.red);

    canvas.save();

    // canvas.translate(-width, -height);
    canvas.translate(element.center.dx, element.center.dy);

    canvas.rotate(radians );
    canvas.translate(-width/3, -height/2);

    // canvas.translate(width, height);
    // canvas.scale(2, 2);
    //
    // canvas.translate(-width / 2, -height / 2);

    Offset positionOffset = Offset(element.center.dx, element.center.dy);
    Rect duckRect = Rect.fromLTWH(
        positionOffset.dx, positionOffset.dy, size.width, size.height);
    svgDuck.draw(canvas, duckRect);

    canvas.restore();
    canvas.drawCircle(element.center, element.radius, circlePaint);

  }
}
