import 'package:shared_preferences/shared_preferences.dart';

class MyPrefferences {
  static SharedPreferences? pref;
  static String sellerEmail = "seller-email";
  static Future init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future saveEmail(String email) {
    return pref!.setString(sellerEmail, email);
  }

  static String getEmail() {
    return pref!.getString(sellerEmail) ?? "OKKKK";
  }

  static Future removeEmail() {
    return pref!.remove(sellerEmail);
  }
}
