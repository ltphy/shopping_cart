import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping/constants/constants.dart';
import 'package:shopping/screens/map_screen/map_screen.constants.dart';
import 'package:shopping/screens/map_screen/model/location_point.dart';
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

  var paintHandle = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.fill;

  var paintBody = Paint()
    ..color = Colors.brown
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
      // drawPallet(canvas, element);
      drawPallet(canvas, element);
    });
  }

  void drawDuck(Canvas canvas, LocationPoint element, Size size) {
    Rect duckRect = Rect.fromLTWH(
        element.center.dx, element.center.dy, size.width, size.height);
    svgDuck.draw(canvas, duckRect);
  }

  void drawCar(LocationPoint element, Canvas canvas) {
    final radians = element.locationInfo.theta;
    double height = 1.25 * 70;
    double width = 2.35 * 70;

    Offset startHandleOffset = Offset(0.0, 0.284 * 70);

    double handleHeight = 0.2 * 70;
    double handleWidth = 1.45 * 70;

    Offset secondStartHandleOffset = Offset(
      0.0,
      height - startHandleOffset.dy - handleHeight,
    );

    Offset startBodyOffset = Offset(0.56 * 70, 0.0);
    double topBodyWidth = 1.0 * 70;

    Offset middleBodyOffset =
        Offset(startBodyOffset.dx + topBodyWidth - 0.01 * 70, 0.0);

    double middleBodyWidth = 0.78 * 70;

    Offset endBodyOffset = Offset(startBodyOffset.dx, height - handleHeight);

    // drawLocation(canvas, element);
    // drawLocationCenter(canvas, element);
    canvas.save();
    //translate to center
    canvas.translate(element.center.dx, element.center.dy);
    //rotate
    canvas.rotate(radians);
    //translate back
    canvas.translate(-element.center.dx, -element.center.dy);
    double dx = element.center.dx - width / 3;
    double dy = element.center.dy - height / 2;

    canvas.drawRect(
        Offset(dx + startHandleOffset.dx, dy + startHandleOffset.dy) &
            Size(handleWidth, handleHeight),
        paintHandle);
    canvas.drawRect(
        Offset(dx + secondStartHandleOffset.dx,
                dy + secondStartHandleOffset.dy) &
            Size(handleWidth, handleHeight),
        paintHandle);

    canvas.drawRect(
        Offset(dx + startBodyOffset.dx, dy + startBodyOffset.dy) &
            Size(topBodyWidth, handleHeight),
        paintBody);
    canvas.drawRect(
        Offset(dx + middleBodyOffset.dx, dy + middleBodyOffset.dy) &
            Size(middleBodyWidth, height),
        paintBody);
    canvas.drawRect(
        Offset(dx + endBodyOffset.dx, dy + endBodyOffset.dy) &
            Size(topBodyWidth, handleHeight),
        paintBody);

    canvas.restore();
  }

  void drawPallet(Canvas canvas, LocationPoint element) {
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
