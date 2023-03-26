import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static SharedPreferences? sharedPreferences;
  static const PREF_DARK_MODE_KEY = "darkMode";

  setDarkMode(bool input) async {
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setBool(PREF_DARK_MODE_KEY, input);
  }

  getDarkMode() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final res = await sharedPreferences!.getBool(PREF_DARK_MODE_KEY) ?? false;
    return res;
  }
}
