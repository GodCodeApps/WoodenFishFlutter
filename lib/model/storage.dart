import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Future<void> setInt(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(key, value);
  }

  static Future<int> getInt(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(key) ?? 0;
  }
  static Future<void> setBool(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }

  static Future<bool> getBool(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(key) ?? false;
  }
}
