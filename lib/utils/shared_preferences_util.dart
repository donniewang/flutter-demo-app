import 'package:shared_preferences/shared_preferences.dart';
import 'package:zdp/constant/string.dart';

class SharedPreferencesUtils {
  static String token = "";

  static Future getToken() async {
    if (token == null || token.isEmpty) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString(Strings.TOKEN_KEY) ?? null;
    }
    return token;
  }
}
