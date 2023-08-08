import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  static Future<bool> setInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setInt(key, value);
  }

  static Future<int?> getInt(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }

  static Future<bool> setDouble(String key, double value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setDouble(key, value);
  }

  static Future<double?> getDouble(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getDouble(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key);
  }

  static Future<bool> remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.remove(key);
  }
}
