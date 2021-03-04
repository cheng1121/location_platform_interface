library location_platform_interface;

import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

part 'src/method_channel_location.dart';

part 'src/model.dart';

class LocationPlatform extends PlatformInterface {
  LocationPlatform() : super(token: _token);

  static final Object _token = Object();

  static LocationPlatform _instance = LocationChannel();

  static LocationPlatform get instance => _instance;

  static set instance(LocationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> setSettings({
     LocationMode mode = LocationMode.low,
     int interval = 1000,
     double distanceFilter = 500,
  }) {
    throw UnimplementedError();
  }

  Future<bool> isBackground() {
    throw UnimplementedError();
  }

  Future<bool> setBackground({required bool enable}) {
    throw UnimplementedError();
  }

  Future<LocationModel?> fetchLocation() {
    throw UnimplementedError();
  }

  Future<bool> checkLocationService() {
    throw UnimplementedError();
  }

  Stream<LocationModel?> get onLocation {
    throw UnimplementedError();
  }
}
