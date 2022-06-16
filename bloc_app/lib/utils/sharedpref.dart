import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<String?> getRestApiData(String url) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    return instance.getString(url);
  }

  static Future<void> setRestApiData(String url, String data) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setString(url, data);
  }
}
