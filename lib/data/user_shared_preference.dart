import 'package:shared_preferences/shared_preferences.dart';

class UserSharePreference {
  // final SharedPreferences = SharedPreferences.getInstance();
  static Future<String?> getUserData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> saveUserData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<void> removeUserData(String key) async {
    // await UserSharePreference.removeUserData("fullname");
    // await UserSharePreference.removeUserData("email");
    // await UserSharePreference.removeUserData("password");
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
