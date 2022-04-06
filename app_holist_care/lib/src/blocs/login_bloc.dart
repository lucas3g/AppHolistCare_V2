import 'package:app_holist_care/src/events/login_events.dart';
import 'package:app_holist_care/src/repositories/login_repository.dart';
import 'package:app_holist_care/src/states/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitialState()) {
    on<SignInEvent>(signIn);
  }

  Future<void> signIn(SignInEvent event, emit) async {
    emit(LoginLoadingState());

    final result = await loginRepository.login(code: event.code);

    if (result) {
      emit(LoginSuccesState());
    } else {
      emit(LoginErrorState());
    }
  }
}
