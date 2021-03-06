import 'package:app_holist_care/src/shared_preferences/token_shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class LoginRepository {
  Future<bool> login({required String token}) async {
    try {
      Dio dio = Dio(
        BaseOptions(baseUrl: 'http://invites-api.genezys.io/api/invite'),
      );

      final response = await dio.get(
        '/checking/9XVeUqNkYJZaCuQQQbZwx1z3XtYXtKfiWKCkNrA4GzdD',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeLogin() async {
    try {
      return await GetIt.I.get<TokenSharedPreferences>().removeLogin();
    } catch (e) {
      return false;
    }
  }
}
