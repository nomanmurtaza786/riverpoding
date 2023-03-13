// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences _sharedPreferences;

//instance
  static final LocalStorage instance = LocalStorage._internal();
  factory LocalStorage() {
    return instance;
  }
  LocalStorage._internal();

//init shared preferences
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Get the stored bool for `key`. If not found, the `defaultValue` will be returned.
  ///
  /// If `defaultValue`
  /// is not provided, it will return `false`
  bool getBool(String key, {bool defaultValue = false}) =>
      _sharedPreferences.getBool(key) ?? defaultValue;

  // Get the stored int for `key`. If not found, the `defaultValue` will be returned.
  // If `defaultValue` is not provided, it will return `0`
  int getInt(String key, {int defaultValue = 0}) =>
      _sharedPreferences.getInt(key) ?? defaultValue;

  // Get the stored double for `key`. If not found, the `defaultValue` will be returned.
  // If `defaultValue` is not provided, it will return `0.0`
  double getDouble(String key, {double defaultValue = 0.0}) =>
      _sharedPreferences.getDouble(key) ?? defaultValue;

  // Get the stored String for `key`. If not found, the `defaultValue` will be returned.
  // If `defaultValue` is not provided, it will return `null`
  String? getString(String key, {String? defaultValue}) =>
      _sharedPreferences.getString(key) ?? defaultValue;

  Object get(String key, {Object defaultValue = const Object()}) =>
      _sharedPreferences.get(key) ?? defaultValue;

  //set bool
  Future<bool> setBool({required String key, required bool value}) async =>
      await _sharedPreferences.setBool(key, value);

  //set int
  Future<bool> setInt({required String key, required int value}) async =>
      await _sharedPreferences.setInt(key, value);

  //set double
  Future<bool> setDouble({required String key, required double value}) async =>
      await _sharedPreferences.setDouble(key, value);

  //set string
  Future<bool> setString({required String key, required String value}) async =>
      await _sharedPreferences.setString(key, value);

//remove key
  Future<bool> remove(String key) async => await _sharedPreferences.remove(key);
}
