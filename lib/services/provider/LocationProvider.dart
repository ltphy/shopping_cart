import 'package:flutter/material.dart';
import 'package:shopping/screens/map_screen/model/location_point.dart';

class LocationProvider extends ChangeNotifier {
  LocationPoint source;
  LocationPoint dst;

  void updateSourceLocation(LocationPoint source) {
    this.source = source;
    notifyListeners();
  }

  void updateDestinationLocation(LocationPoint dest) {
    this.dst = dest;
    notifyListeners();
  }
}
