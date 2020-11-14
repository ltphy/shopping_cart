import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping/screens/map_screen/map_screen.constants.dart';
import 'package:shopping/screens/map_screen/model/location_info.dart';
import 'package:shopping/utils/scaleOffset.dart';

// [-1.242,-0.005,-0.024435]
// [-0.94794,0.0151046,0.16096]
// [-0.662624,0.0890702,0.346355]
// [-0.101834,0.291461,0.34635]
// [0.458955,0.493852,0.346355]
class LocationMap {
  List<LocationPoint> locationList;

  Offset center;

  Offset translateToCenter(Offset offset) {
    return offset.translate(center.dx / 2, offset.dy / 2);
  }

  LocationMap({List<LocationInfo> locationInfoList, Size size}) {
    this.center = Offset(size.width / 2, size.height / 2);
    this.locationList = [];
    this.locationList = locationInfoList.map((LocationInfo locationInfo) {
      Offset point = scaleOffset(locationInfo.x, locationInfo.y);
      point = translateToCenter(point);
      return LocationPoint(
          radius: radiusCenter, center: point, locationInfo: locationInfo);
    }).toList();
  }

  double getDistance(Offset point, Offset center) {
    return sqrt(pow(point.dx - center.dx, 2) + pow(point.dy - center.dy, 2));
  }

  LocationPoint getLocationPointFromOffset(Offset point) {
    LocationPoint locationPoint = this.locationList.firstWhere((element) {
      Offset iconCenter = element.center.translate(
          cos(element.locationInfo.theta) * iconSize / 2,
          sin(element.locationInfo.theta) * iconSize / 2);
      return getDistance(point, iconCenter) <= iconSize / 2 ||
          getDistance(point, element.center) <= element.radius;
    }, orElse: () => null);
    return locationPoint;
  }
}

class LocationPoint {
  final double radius;
  final Offset center;
  final LocationInfo locationInfo;

  LocationPoint({this.radius, this.center, this.locationInfo});
}
