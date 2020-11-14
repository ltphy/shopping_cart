class LocationInfo {
  final String address;
  final double x;
  final double y;
  final double theta;

  LocationInfo(this.address, this.x, this.y, this.theta);

  factory LocationInfo.fromJson(Map<String, dynamic> locationInfo) {
    return LocationInfo(locationInfo["address"], locationInfo["x"],
        locationInfo["y"], locationInfo["theta"]);
  }
}

class ListLocationInfo {
  List<LocationInfo> locationInfo;

  ListLocationInfo(List locationInfo) {
    this.locationInfo = locationInfo;
  }

  factory ListLocationInfo.fromJson(Map<String, dynamic> obj) {
    List locationList = obj["locations"];
    return ListLocationInfo(locationList.map((e) {
      return LocationInfo.fromJson(e);
    }).toList());
  }
}
