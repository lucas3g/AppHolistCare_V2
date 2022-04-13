import 'package:app_holist_care/src/pages/login/login_page.dart';
import 'package:app_holist_care/src/pages/scan_qrcode/scan_qrcode_page.dart';
import 'package:app_holist_care/src/pages/splash/splash_page.dart';
import 'package:app_holist_care/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holist Care',
      theme: ThemeData(
        primarySwatch: AppTheme.colors.primary,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/scan': (context) => const ScanNFT(),
      },
    );
  }
}
