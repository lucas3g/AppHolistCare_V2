import 'package:app_holist_care/src/shared_preferences/token_shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ScanRepository {
  Future<String> verifyNFT({required String nft}) async {
    try {
      Dio dio = Dio(
        BaseOptions(baseUrl: 'http://invites-api.genezys.io/api/invite'),
      );

      final sharedPref = GetIt.I.get<TokenSharedPreferences>();

      final response = await dio.get(
        '/checking/$nft',
        options: Options(
          headers: {
            'token': sharedPref.getToken(),
          },
        ),
      );
      if (response.statusCode == 200) {
        if (response.data['status'] == 'accept') {
          return 'ACCEPT';
        } else {
          return 'ALREADYUSED';
        }
      } else {
        return 'ERROR';
      }
    } catch (e) {
      return 'ERROR';
    }
  }
}
