class LoginRepository {
  Future<bool> login({required String code}) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
