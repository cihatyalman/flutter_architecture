import 'package:shared_preferences/shared_preferences.dart';

final prefManager = PrefManager();

class PrefManager {
  SharedPreferences? prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

// #region token
  String? get token {
    var data = prefs?.getString("token");
    return (data == null || data.isEmpty) ? null : data;
  }

  Future setToken(String? value) async =>
      await prefs?.setString("token", value ?? "");
  Future deleteToken() async => await prefs?.remove("token");
// #endregion

}
