import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _isFirstLogin = prefs.getBool('ff_isFirstLogin') ?? _isFirstLogin;
  }

  SharedPreferences prefs;

  bool _isFirstLogin = true;
  bool get isFirstLogin => _isFirstLogin;
  set isFirstLogin(bool _value) {
    _isFirstLogin = _value;
    prefs.setBool('ff_isFirstLogin', _value);
  }

  bool canEditProfile = false;
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
