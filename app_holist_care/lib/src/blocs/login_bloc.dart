import 'package:app_holist_care/src/events/login_events.dart';
import 'package:app_holist_care/src/repositories/login_repository.dart';
import 'package:app_holist_care/src/shared_preferences/token_shared_preferences.dart';
import 'package:app_holist_care/src/states/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final LoginRepository loginRepository;
  final sharedPref = GetIt.I.get<TokenSharedPreferences>();

  LoginBloc({required this.loginRepository}) : super(LoginInitialState()) {
    on<SignInEvent>(signIn);
  }

  Future<void> signIn(SignInEvent event, emit) async {
    emit(LoginLoadingState());

    final result = await loginRepository.login(token: event.token);

    if (result) {
      await sharedPref.setToken(token: event.token);
      emit(LoginSuccesState());
      await Future.delayed(const Duration(seconds: 1));
      emit(LoginInitialState());
    } else {
      emit(LoginErrorState());
    }
  }
}
