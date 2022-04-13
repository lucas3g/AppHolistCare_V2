import 'package:app_holist_care/src/blocs/login_bloc.dart';
import 'package:app_holist_care/src/blocs/scan_bloc.dart';
import 'package:app_holist_care/src/repositories/login_repository.dart';
import 'package:app_holist_care/src/repositories/scan_repository.dart';
import 'package:app_holist_care/src/shared_preferences/token_shared_preferences.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //REPOSITORIES
    getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepository(),
    );
    getIt.registerLazySingleton<ScanRepository>(
      () => ScanRepository(),
    );

    //BLOC
    getIt.registerLazySingleton<LoginBloc>(
      () => LoginBloc(loginRepository: getIt()),
    );
    getIt.registerLazySingleton<ScanBloc>(
      () => ScanBloc(scanRepository: getIt()),
    );

    //SHARED PREFERENCES
    getIt.registerSingleton<TokenSharedPreferences>(TokenSharedPreferences());
  }
}
