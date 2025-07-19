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

//*Generic method to save data
  static setData<T>(String key, T value) {
    if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is String) {
      _preferences.setString(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    } else {
      throw Exception("Unsupported type");
    }
  }

  //*Save Data
  // prefs.setData<bool>('isLoggedIn', true);
  // prefs.setData<String>('username', 'EzatRashad');

  // Generic method to retrieve data
  T? getData<T>(String key) {
    if (!_preferences.containsKey(key)) return null;

    dynamic value = _preferences.get(key);
    if (value is T) {
      return value;
    }
    return null;
  }

  //* Retrieve Data
  //bool? isLoggedIn = prefs.getData<bool>('isLoggedIn');
  //String? username = prefs.getData<String>('username');

  //* Remove a specific key
  static remove(String key) {
    _preferences.remove(key);
  }
  //* Remove a key
  // prefs.remove('username');

  // Clear all stored data
  static clear() async {
    _preferences.clear();
  }

  //* Clear all stored data
  //   prefs.clear();
}
