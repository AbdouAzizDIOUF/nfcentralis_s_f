import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getSharedPreferenceToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

Future<String?> getSharedPreferenceFirstName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('firstName');
}

Future<String?> getSharedPreferenceLastName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('lastName');
}

Future<String?> getSharedPreferenceRole() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('role');
}

Future<String?> getSharedPreferenceUserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('id');
}
