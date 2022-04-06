import 'package:app_holist_care/src/blocs/login_bloc.dart';
import 'package:app_holist_care/src/repositories/login_repository.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //REPOSITORIES
    getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepository(),
    );

    //BLOC
    getIt.registerLazySingleton<LoginBloc>(
        () => LoginBloc(loginRepository: getIt()));
  }
}
