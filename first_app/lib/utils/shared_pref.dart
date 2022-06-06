import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SharedPref {
  static const _IsUserLoggedIn = "IsUserLoggedIn";
  static const _User = "user-dataaaaaaaaaaaaaa";

  static setIsUserLoggedIn(bool value) async {
    final _instance = await SharedPreferences.getInstance();
    _instance.setBool(_IsUserLoggedIn, value);
  }

  static Future<bool> getIsUserLoggedIn() async {
    final _instance = await SharedPreferences.getInstance();
    final value = _instance.getBool(_IsUserLoggedIn);
    if (value == null) {
      return false;
    }
    return value;
  }

  static saveuser(User user) async {
    Map userMap = user.toJson();
    final userString = json.encode(userMap);
    final _instance = await SharedPreferences.getInstance();

    _instance.setString(_User, userString);
  }

  static Future<User?> getUser() async {
    final _instance = await SharedPreferences.getInstance();
    final _value = _instance.getString(_User);

    if (_value == null) {
      return null;
    }
    print(_value);
    final decoded = json.decode(_value);
    User _user = User.convertFromJson(decoded);
    return _user;
  }

  static void logout() async {
    final _instance = await SharedPreferences.getInstance();
    _instance.clear();
  }
}
