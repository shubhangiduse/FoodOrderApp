import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPref {
  static Future getUserDetails() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    Map userDetails = {};
    userDetails['UserName'] = _prefs.getString('UserName') ?? '';
    userDetails['EmailId'] = _prefs.getString('EmailId') ?? '';
    return userDetails;
  }
}
