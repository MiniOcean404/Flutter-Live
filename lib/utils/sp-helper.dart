import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  // static SpHelper _instance = SpHelper._internal();
  static late SharedPreferences prefs;
  //
  // // 工厂方法构造函数
  // factory SpHelper() => _instance;
  // // instance的getter方法，SpHelper.instance获取对象
  // static SpHelper get instance => _instance;
  //
  // //构造函数初始化
  // SpHelper._internal();

  static Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  // 存数据
  static setLocalStorage<T>(String key, T value) {
    String type = value.runtimeType.toString();

    switch (type) {
      case "String":
        prefs.setString(key, value as String);
        break;
      case "int":
        prefs.setInt(key, value as int);
        break;
      case "bool":
        prefs.setBool(key, value as bool);
        break;
      case "double":
        prefs.setDouble(key, value as double);
        break;
      case "List<String>":
        prefs.setStringList(key, value as List<String>);
        break;
    }
  }

  // 获取持久化数据
  static T getLocalStorage<T>(String key) {
    dynamic value = prefs.get(key);
    if (value.runtimeType.toString() == "String" && _isJson(value)) {
      return json.decode(value);
    }
    log('11111111111111111111111$value');
    return value == null ? '' : value;
  }

  // 获取任意值的key
  static void getAny(String key) async {
    prefs.get(key);
  }

  /// 获取持久化数据中所有存入的key
  static Set<String> getKeys() {
    return prefs.getKeys();
  }

  /// 获取持久化数据中是否包含某个key
  static bool containsKey(String key) {
    return prefs.containsKey(key);
  }

  /// 删除持久化数据中某个key
  static Future<bool> remove(String key) async {
    return await prefs.remove(key);
  }

  /// 清除所有持久化数据
  static Future<bool> clear() async {
    return await prefs.clear();
  }

  /// 重新加载所有数据,仅重载运行时
  static Future<void> reload() async {
    return await prefs.reload();
  }

  /// 判断是否是json字符串
  static _isJson(String value) {
    try {
      JsonDecoder().convert(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
