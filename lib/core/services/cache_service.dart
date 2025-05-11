import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseCache {
  Future<void> initializeCache();
  Future<bool> insertStringToCache(
      {required String key, required String value});
  String? getStringFromCache({required String key});

  Future<bool> insertIntToCache({required String key, required int value});
  int? getIntFromCache({required String key});

  Future<bool> insertBoolToCache({required String key, required bool value});
  bool? getBoolFromCache({required String key});

  Future<bool> insertDoubleToCache(
      {required String key, required double value});
  double? getDoubleFromCache({required String key});

  Future<bool> deleteCache({required String key});
}

class CacheImplBySharedPreferences extends BaseCache {
  late final SharedPreferences sharedPreferences;

  @override
  Future<void> initializeCache() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<bool> insertStringToCache(
      {required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  @override
  String? getStringFromCache({required String key}) {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool> insertIntToCache(
      {required String key, required int value}) async {
    return await sharedPreferences.setInt(key, value);
  }

  @override
  int? getIntFromCache({required String key}) {
    return sharedPreferences.getInt(key);
  }

  @override
  Future<bool> insertBoolToCache(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  @override
  bool? getBoolFromCache({required String key}) {
    return sharedPreferences.getBool(key);
  }

  @override
  Future<bool> insertDoubleToCache(
      {required String key, required double value}) async {
    return await sharedPreferences.setDouble(key, value);
  }

  @override
  double? getDoubleFromCache({required String key}) {
    return sharedPreferences.getDouble(key);
  }

  @override
  Future<bool> deleteCache({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
