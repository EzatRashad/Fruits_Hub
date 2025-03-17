import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    _preferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }

  static setString(String key, String value) {
    _preferences.setString(key, value);
  }

  static String? getString(String key) {
    return _preferences.getString(key) ?? '';
  }


}
