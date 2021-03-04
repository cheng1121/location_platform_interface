part of location_platform_interface;

class LocationModel {
  LocationModel._(this.latitude, this.longitude, this.accuracy, this.altitude,
      this.speed, this.speedAccuracy, this.heading, this.time);

  factory LocationModel.fromMap(Map<String, double> dataMap) {
    return LocationModel._(
      dataMap['latitude']!,
      dataMap['longitude']!,
      dataMap['accuracy'],
      dataMap['altitude'],
      dataMap['speed'],
      dataMap['speed_accuracy'],
      dataMap['heading'],
      dataMap['time'],
    );
  }

  final double latitude;

  final double longitude;

  final double? accuracy;
  final double? altitude;
  final double? speed;

  ///  iOS is 0
  final double? speedAccuracy;
  final double? heading;
  final double? time;

  @override
  String toString() => 'LocationData<lat: $latitude, long: $longitude>';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationModel &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          accuracy == other.accuracy &&
          altitude == other.altitude &&
          speed == other.speed &&
          speedAccuracy == other.speedAccuracy &&
          heading == other.heading &&
          time == other.time;

  @override
  int get hashCode =>
      latitude.hashCode ^
      longitude.hashCode ^
      accuracy.hashCode ^
      altitude.hashCode ^
      speed.hashCode ^
      speedAccuracy.hashCode ^
      heading.hashCode ^
      time.hashCode;
}

enum LocationMode {
  powerSave,
  low,
  balanced,
  high,
}
