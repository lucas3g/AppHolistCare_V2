abstract class LoginEvents {}

class SignInEvent extends LoginEvents {
  final String token;

  SignInEvent({
    required this.token,
  });
}
