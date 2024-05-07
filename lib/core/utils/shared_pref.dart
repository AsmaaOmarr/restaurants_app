import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _keyUserToken = 'userToken';

  static Future<void> saveUserToken(String userToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserToken, userToken);
  }

  static Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString(_keyUserToken);
    if (userToken == null) {
      return null;
    }
    return userToken;
  }

  static Future<void> removeUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_keyUserToken);
  }
}
