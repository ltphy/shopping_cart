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
  TextPainter sourcePainter = TextPainter(textDirection: TextDirection.rtl);

  MarkerPainter(this.locationProvider);

  @override
  void paint(Canvas canvas, Size size) {
    print("REDRAW MARKER");
    this.center = Offset(size.width / 2, size.height / 2);
    if (locationProvider.source != null) {
      drawLocationSourceIcon(canvas, locationProvider.source);
    }
  }

  void drawDstMarker(Canvas canvas, LocationPoint locationPoint) {
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

  void drawLocationSourceIcon(Canvas canvas, LocationPoint locationPoint) {
    final icon = Icons.arrow_upward;
    sourcePainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
            color: Colors.green,
            height: 1,
            fontSize: iconSize / 2,
            fontFamily: icon.fontFamily));
    sourcePainter.layout();
    sourcePainter.paint(
        canvas, locationPoint.center.translate(-iconSize / 4, -iconSize / 4));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
