part of location_platform_interface;

class LocationChannel extends LocationPlatform {
  factory LocationChannel() {
    _instance = LocationChannel._();
    return _instance;
  }

  LocationChannel._()
      : _methodChannel = const MethodChannel('com.bd.cheng/location'),
        _eventChannel = const EventChannel('com.bd.cheng/locationStream');

  static late LocationChannel _instance;
  final MethodChannel _methodChannel;
  final EventChannel _eventChannel;

  late Stream<LocationModel> _onChanged;

  @override
  Future<bool> setSettings(
      {LocationMode mode = LocationMode.high,
      int interval = 1000,
      double distanceFilter = 0}) async {
    final int? result =
        await _methodChannel.invokeMethod('setSetting', <String, Object>{
      'mode': mode.index,
      'interval': interval,
      'distanceFilter': distanceFilter,
    });
    return result != null && result == 1;
  }

  @override
  Future<bool> isBackground() async {
    final int? result = await _methodChannel.invokeMethod('isBackground');
    return result != null && result == 1;
  }

  @override
  Future<bool> setBackground({required bool enable}) async {
    final int? result =
        await _methodChannel.invokeMethod('setBackground', <String, dynamic>{
      'enable': enable,
    });
    return result != null && result == 1;
  }

  @override
  Future<LocationModel?> fetchLocation() async {
    final Map<Object, Object>? result =
        await _methodChannel.invokeMethod('fetchLocation');
    if (result != null) {
      return LocationModel.fromMap(result.cast<String, double>());
    }

    return null;
  }

  @override
  Future<bool> checkLocationService() async {
    final bool? result =
        await _methodChannel.invokeMethod<bool>('checkLocationService');
    return result ?? false;
  }

// @override
// Stream<LocationModel> get onLocation => _onChanged ??= _eventChannel
//     .receiveBroadcastStream()
//     .map<LocationModel>((dynamic event) => LocationModel.fromMap(event) );
}
