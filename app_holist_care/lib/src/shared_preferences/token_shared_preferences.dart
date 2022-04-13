import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedPreferences extends ChangeNotifier {
  late SharedPreferences _prefs;
  late String conectado = 'N';

  String token = '';

  TokenSharedPreferences() {
    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
    _readToken();
  }

  Future<void> _startPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _readToken() {
    final String tokenShared = _prefs.getString('token') ?? '';

    token = tokenShared;

    if (token.isNotEmpty) {
      conectado = 'S';
    }

    notifyListeners();
  }

  setToken({required String token}) async {
    await _prefs.setString('token', token);
    await _readToken();
  }

  String getToken() {
    return _prefs.getString('token') ?? '';
  }

  Future<bool> removeLogin() async {
    return await _prefs.remove('token');
  }
}
