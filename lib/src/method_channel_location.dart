part of location_platform_interface;

class LocationChannel extends LocationPlatform {
  factory LocationChannel() {
    if (_instance == null) {
      const MethodChannel methodChannel =
          MethodChannel('com.bd.cheng/location');
      const EventChannel eventChannel =
          EventChannel('com.bd.cheng/locationStream');
      _instance = LocationChannel._(methodChannel, eventChannel);
    }
    return _instance;
  }

  LocationChannel._(this._methodChannel, this._eventChannel);

  static LocationChannel _instance;
  final MethodChannel _methodChannel;
  final EventChannel _eventChannel;

  Stream<LocationModel> _onChanged;

  @override
  Future<bool> setSettings(
      {LocationMode mode = LocationMode.high,
      int interval = 1000,
      double distanceFilter = 0}) async {
    final int result =
        await _methodChannel.invokeMethod('setSetting', <String, dynamic>{
      'mode': mode.index,
      'interval': interval,
      'distanceFilter': distanceFilter,
    });
    return result == 1;
  }

  @override
  Future<bool> isBackground() async{
    final int result = await _methodChannel.invokeMethod('isBackground');
    return result == 1;
  }

  @override
  Future<bool> setBackground({bool enable}) async{
     final int result = await _methodChannel.invokeMethod('setBackground',<String,dynamic>{
       'enable':enable,
     });
    return result == 1;
  }

  @override
  Future<LocationModel> fetchLocation() async{
    final Map<String,double> result = await _methodChannel.invokeMethod('fetchLocation');
    return LocationModel.fromMap(result);
  }

  @override
  Future<bool> openService() async{
    final int result = await _methodChannel.invokeMethod('openService');
    return result == 1;
  }

  // @override
  // Stream<LocationModel> get onLocation => _onChanged ??= _eventChannel
  //     .receiveBroadcastStream()
  //     .map<LocationModel>((dynamic event) => LocationModel.fromMap(event) );
}
