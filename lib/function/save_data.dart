import 'package:shared_preferences/shared_preferences.dart';

void saveData({required String myName, required String data}) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString(myName, data);
}
