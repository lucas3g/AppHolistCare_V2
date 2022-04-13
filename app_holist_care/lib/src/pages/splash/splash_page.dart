import 'package:app_holist_care/src/shared_preferences/token_shared_preferences.dart';
import 'package:app_holist_care/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final sharedPref = GetIt.I.get<TokenSharedPreferences>();
  Future<void> getToken() async {
    await Future.delayed(const Duration(seconds: 1));

    if (sharedPref.conectado == 'S') {
      await Navigator.pushReplacementNamed(context, '/scan');
    } else {
      await Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void initState() {
    super.initState();

    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      body: Center(child: Image.asset('assets/images/logo.png')),
    );
  }
}
