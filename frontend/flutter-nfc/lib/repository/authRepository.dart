import 'package:shared_preferences/shared_preferences.dart';

const String authKey = 'AuthKey';

class AuthRepository {
  final SharedPreferences preference;

  AuthRepository(this.preference);

  Future isUserLoggedIn() async =>
      Future.delayed(const Duration(seconds: 2)).then((value) {
        return preference.getBool(authKey) ?? false;
      });

  Future _updateLoginStatus(bool loggedIn) =>
      Future.delayed(const Duration(seconds: 2)).then((value) {
        return preference.setBool(authKey, loggedIn);
      });

  Future logout() => _updateLoginStatus(false);

  Future login() => _updateLoginStatus(true);
}
