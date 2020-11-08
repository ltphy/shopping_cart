import 'package:flutter/material.dart';
import 'package:shopping/screens/map_screen/model/location_point.dart';
import 'package:shopping/services/provider/LocationProvider.dart';
import 'package:shopping/utils/scaleOffset.dart';

import '../map_screen.constants.dart';

// import 'dart:ui';
class MarkerPainter extends CustomPainter {
  Offset center;
  final LocationProvider locationProvider;
  TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);

  MarkerPainter(this.locationProvider);

  @override
  void paint(Canvas canvas, Size size) {
    print("REDRAW MARKER");
    this.center = Offset(size.width / 2, size.height / 2);
    drawMarker(canvas, locationProvider.source);
  }

  void drawMarker(Canvas canvas, LocationPoint locationPoint) {
    if (locationPoint != null) {
      final icon = Icons.location_on_rounded;
      textPainter.text = TextSpan(
          text: String.fromCharCode(icon.codePoint),
          style: TextStyle(
              color: Colors.red,
              height: 1,
              fontSize: iconSize,
              fontFamily: icon.fontFamily));
      textPainter.layout();
      textPainter.paint(
          canvas, translateToIconLocation(locationPoint.center, iconSize));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
