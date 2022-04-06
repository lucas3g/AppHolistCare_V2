abstract class LoginEvents {}

class SignInEvent extends LoginEvents {
  final String code;

  SignInEvent({
    required this.code,
  });
}
